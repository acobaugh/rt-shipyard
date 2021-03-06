# -*- perl -*-

use strict;
use Set::IntSpan 1.17;

my $N = 1;
sub Not { print "not " }
sub OK
{
    my($function, $test) = @_;

    $test ||= [];
    for (@$test) { defined $_ or $_ = '<undef>' }
    my $expected = pop @$test;

    print "ok $N $function: @$test\t-> $expected\n";

    $N++;
}

my @At_die = 
(
 [ "(-0",  42, "<die>" ],
 [ "0-)", -42, "<die>" ],
);

my @At_test =
(
 [ "-"	       	     ,   0, undef ],
 [ "-"	       	     ,  -1, undef ],
 [ "1-10,20-30"	     ,  25, undef ],
 [ "1-10,20-30"	     , -25, undef ],

 [ "0-)"       	     ,   0,   0   ],
 [ "0-)"       	     ,  42,  42   ],
 [ "(--1"      	     ,  -1,  -1   ],
 [ "(--1"      	     , -42, -42   ],
 [ "1-10,20-)" 	     ,  15,  25   ],
 [ "(--21,-10--1"    , -15, -25   ],

 [ "0-9"             ,   0,   0   ],
 [ "0-9"             ,   5,   5   ],
 [ "0-9"             ,   9,   9   ],
 [ "0-9"             ,  10, undef ],

 [ "0-9"             ,  -1,   9   ],
 [ "0-9"             ,  -5,   5   ],
 [ "0-9"             , -10,   0   ],
 [ "0-9"             , -11, undef ],

 [ "1-10,21-30,41-50",   5,   6   ],
 [ "1-10,21-30,41-50",  15,  26   ],
 [ "1-10,21-30,41-50",  25,  46   ],
 [ "1-10,21-30,41-50",  30, undef ],
 [ "1-10,21-30,41-50",  -1,  50   ],
 [ "1-10,21-30,41-50", -11,  30   ],
 [ "1-10,21-30,41-50", -21,  10   ],
 [ "1-10,21-30,41-50", -30,   1   ],
 [ "1-10,21-30,41-50", -31, undef ],
);

my @Splice_die = 
(
 [ "(-0"    ,  0,  1, "<die>" ],
 [ "0-)"    , -1,  1, "<die>" ],
 [ "0-)"    , -2, -1, "<die>" ],
 [ "0-)"    ,  0, -1, "<die>" ],
);

my @Splice_test = 
(
 # empty sets
 [ "-"	 	     ,   0,  undef, "-"    	     	],
 [ "-"	 	     ,   0, 	 0, "-"    	     	],
 [ "-"	 	     ,   0, 	 1, "-"    	     	],
 [ "-"	 	     ,   0, 	-1, "-"    	     	],

 # infinite sets
 [ "0-)"             ,   0,      0, "-"			],
 [ "0-)"             ,   0,      1, "0"			],
 [ "0-)"             ,   0,     10, "0-9"		],
 [ "0-)"             ,   5,      0, "-"			],
 [ "0-)"             ,   5,      1, "5"			],
 [ "0-)"             ,   5,     10, "5-14"		],
 [ "1-10,21-30,41-)" , 	 5,     20, "6-10,21-30,41-45"  ],
 [ "1-10,21-30,41-)" , 	15,     10, "26-30,41-45"  	],

 [ "(-0"             ,  -1,      0, "-"			],
 [ "(-0"             ,  -1,      1, "0"			],
 [ "(-0"             , -10,      5, "-9--5"		],
 [ "(-0"             , -10,     -3, "-9--3"		],
 [ "(-10,21-30,41-50", -15,     10, "26-30,41-45"  	],
 [ "(-10,21-30,41-50", -15,    -10, "26-30"  		],
 [ "(-10,21-30,41-50", -15,  undef, "26-30,41-50"	],

 # empty slices
 [ "1-10"	     ,  10,      1, "-"    	     	],
 [ "1-10"	     ,   5,  	 0, "-"    	     	],
 [ "1-10"	     ,  -5,  	 0, "-"    	     	],
 [ "1-10"	     , -10,  	 0, "-"    	     	],

 # positive offset, no length
 [ "1-10"	     ,   0,  undef, "1-10"  	     	],
 [ "1-10"	     ,   1,  undef, "2-10" 	     	],
 [ "1-10"	     ,   5,  undef, "6-10"  	     	],
 [ "1-10"	     ,   9,  undef, "10"   	     	],
 [ "1-10"	     ,  10,  undef, "-"    	     	],

 # positive offset, positive length
 [ "1-10"	     ,   0, 	 3, "1-3"  	     	],
 [ "1-10"	     ,   5, 	 3, "6-8"  	     	],
 [ "1-10"	     ,   7, 	 3, "8-10" 	     	],
 [ "1-10"	     ,   9, 	 1, "10"   	     	],
 [ "1-10"	     ,  10, 	 1, "-"    	     	],
 [ "1-10"	     ,   0, 	10, "1-10" 	     	],
 [ "1-10"	     ,   0, 	20, "1-10" 	     	],

 # positive offset, negative length
 [ "1-10"	     ,   0, 	-3, "1-7"  	     	],
 [ "1-10"	     ,   5, 	-3, "6-7"  	     	],
 [ "1-10"	     ,   6, 	-3, "7"    	     	],
 [ "1-10"	     ,   7, 	-3, "-"    	     	],
 [ "1-10"	     ,   8, 	-3, "-"    	     	],
 [ "1-10"	     ,   9, 	-3, "-"    	     	],

 # negative offset, no length
 [ "1-10"	     ,  -1,  undef, "10" 	     	],
 [ "1-10"	     ,  -2,  undef, "9-10"  	     	],
 [ "1-10"	     ,  -5,  undef, "6-10"  	     	],
 [ "1-10"	     ,  -9,  undef, "2-10"   	     	],
 [ "1-10"	     , -10,  undef, "1-10"    	     	],

 # negative offset, positive length
 [ "1-10"	     ,  -2, 	 2, "9-10" 	     	],
 [ "1-10"	     ,  -5, 	 2, "6-7"  	     	],
 [ "1-10"	     , -10, 	 3, "1-3"  	     	],
 [ "1-10"	     , -10, 	10, "1-10" 	     	],
 [ "1-10"	     , -10, 	20, "1-10" 	     	],
 [ "1-10"	     , -20, 	20, "1-10" 	     	],

 # negative offset, negative length
 [ "1-10"	     , -10,     -3, "1-7"  	     	],
 [ "1-10"	     ,  -5,     -3, "6-7"  	     	],
 [ "1-10"	     ,  -5,     -1, "6-9"  	     	],
 [ "1-10"	     ,  -3,     -3, "-"    	     	],
 [ "1-10"	     , -10,    -10, "-"    	     	],
 [ "1-10"	     , -11,    -10, "-"    	     	],
 [ "1-10"	     , -20,     -9, "1"    	     	],
 [ "1-10"	     , -20,     -1, "1-9"    	     	],

 [ "1-10,21-30,41-50", 	 0,      0, "-"    	     	],

 # positive offset, no length
 [ "1-10,21-30,41-50", 	 0,  undef, "1-10,21-30,41-50" 	],
 [ "1-10,21-30,41-50", 	 9,  undef, "10,21-30,41-50" 	],
 [ "1-10,21-30,41-50", 	10,  undef, "21-30,41-50" 	],
 [ "1-10,21-30,41-50", 	19,  undef, "30,41-50" 		],
 [ "1-10,21-30,41-50", 	20,  undef, "41-50"		],
 [ "1-10,21-30,41-50", 	29,  undef, "50"		],
 [ "1-10,21-30,41-50", 	30,  undef, "-"			],

 # positive offset, positive length
 [ "1-10,21-30,41-50", 	 0,  	 1, "1"    	     	],
 [ "1-10,21-30,41-50", 	 9,  	 1, "10"   	     	],
 [ "1-10,21-30,41-50", 	10,  	 1, "21"   	     	],
 [ "1-10,21-30,41-50", 	19,  	 1, "30"   	     	],
 [ "1-10,21-30,41-50", 	20,  	 1, "41"   	     	],
 [ "1-10,21-30,41-50", 	29,  	 1, "50"   	     	],

 [ "1-10,21-30,41-50", 	 0, 	10, "1-10"       	],
 [ "1-10,21-30,41-50", 	 0, 	11, "1-10,21"    	],
 [ "1-10,21-30,41-50", 	 0, 	20, "1-10,21-30" 	],
 [ "1-10,21-30,41-50", 	 0, 	21, "1-10,21-30,41"     ],
 [ "1-10,21-30,41-50", 	 0, 	30, "1-10,21-30,41-50"  ],

 [ "1-10,21-30,41-50", 	 5, 	10, "6-10,21-25"   	],
 [ "1-10,21-30,41-50", 	 5, 	11, "6-10,21-26"   	],
 [ "1-10,21-30,41-50", 	 5, 	20, "6-10,21-30,41-45"  ],
 [ "1-10,21-30,41-50", 	 5, 	21, "6-10,21-30,41-46"  ],
 [ "1-10,21-30,41-50", 	 5, 	30, "6-10,21-30,41-50"  ],

 [ "1-10,21-30,41-50", 	15, 	10, "26-30,41-45" 	],
 [ "1-10,21-30,41-50", 	15, 	11, "26-30,41-46"  	],
 [ "1-10,21-30,41-50", 	15, 	20, "26-30,41-50" 	],
 [ "1-10,21-30,41-50", 	15, 	21, "26-30,41-50" 	],
 [ "1-10,21-30,41-50", 	15, 	30, "26-30,41-50" 	],

 [ "1-10,21-30,41-50", 	25, 	 1, "46" 	   	],
 [ "1-10,21-30,41-50", 	25, 	 2, "46-47" 	    	],
 [ "1-10,21-30,41-50", 	25, 	 3, "46-48" 	    	],
 [ "1-10,21-30,41-50", 	25, 	 5, "46-50" 	    	],
 [ "1-10,21-30,41-50", 	25, 	 6, "46-50" 	    	],
 [ "1-10,21-30,41-50", 	25, 	10, "46-50" 	    	],

 # positive offset, negative length
 [ "1-10,21-30,41-50", 	 0,     -1, "1-10,21-30,41-49"  ],
 [ "1-10,21-30,41-50", 	 9,     -1, "10,21-30,41-49"    ],
 [ "1-10,21-30,41-50", 	10,     -1, "21-30,41-49"       ],
 [ "1-10,21-30,41-50", 	19,     -1, "30,41-49"          ],
 [ "1-10,21-30,41-50", 	20,     -1, "41-49"             ],
 [ "1-10,21-30,41-50", 	29,     -1, "-"   	     	],

 [ "1-10,21-30,41-50", 	 0,    -10, "1-10,21-30"  	],
 [ "1-10,21-30,41-50", 	 0,    -11, "1-10,21-29" 	],
 [ "1-10,21-30,41-50", 	 0,    -20, "1-10" 	    	],
 [ "1-10,21-30,41-50", 	 0,    -21, "1-9" 		],
 [ "1-10,21-30,41-50", 	 0,    -30, "-" 		],

 [ "1-10,21-30,41-50", 	 5,    -10, "6-10,21-30"       	],
 [ "1-10,21-30,41-50", 	 5,    -11, "6-10,21-29"       	],
 [ "1-10,21-30,41-50", 	 5,    -20, "6-10" 	    	],
 [ "1-10,21-30,41-50", 	 5,    -21, "6-9" 	    	],
 [ "1-10,21-30,41-50", 	 5,    -30, "-" 		],

 [ "1-10,21-30,41-50", 	15,    -10, "26-30" 	    	],
 [ "1-10,21-30,41-50", 	15,    -11, "26-29" 	    	],
 [ "1-10,21-30,41-50", 	15,    -20, "-" 		],
 [ "1-10,21-30,41-50", 	15,    -21, "-" 		],
 [ "1-10,21-30,41-50", 	15,    -30, "-" 		],

 [ "1-10,21-30,41-50", 	25,     -1, "46-49"   	    	],
 [ "1-10,21-30,41-50", 	25,     -2, "46-48" 	    	],
 [ "1-10,21-30,41-50", 	25,     -3, "46-47" 	    	],
 [ "1-10,21-30,41-50", 	25,     -5, "-" 	    	],
 [ "1-10,21-30,41-50", 	25,     -6, "-" 	    	],
 [ "1-10,21-30,41-50", 	25,    -10, "-" 	    	],

 # negative offset, no length
 [ "1-10,21-30,41-50", 	-1,  undef, "50"		],
 [ "1-10,21-30,41-50", -10,  undef, "41-50"		],
 [ "1-10,21-30,41-50", -11,  undef, "30,41-50" 		],
 [ "1-10,21-30,41-50", -20,  undef, "21-30,41-50" 	],
 [ "1-10,21-30,41-50", -21,  undef, "10,21-30,41-50" 	],
 [ "1-10,21-30,41-50", -29,  undef, "2-10,21-30,41-50" 	],
 [ "1-10,21-30,41-50", -30,  undef, "1-10,21-30,41-50" 	],

 # negative offset, positive length
 [ "1-10,21-30,41-50", 	-1,  	 1, "50"   	     	],
 [ "1-10,21-30,41-50", 	-9,  	 1, "42"   	     	],
 [ "1-10,21-30,41-50", -10,  	 1, "41"   	     	],
 [ "1-10,21-30,41-50", -19,  	 1, "22"   	     	],
 [ "1-10,21-30,41-50", -20,  	 1, "21"   	     	],
 [ "1-10,21-30,41-50", -29,  	 1, "2"   	     	],
 [ "1-10,21-30,41-50", -30,  	 1, "1"   	     	],
 [ "1-10,21-30,41-50", -40,  	 1, "1"   	     	],

 [ "1-10,21-30,41-50", 	-1, 	10, "50"       	    	],
 [ "1-10,21-30,41-50", 	-9, 	10, "42-50"    	    	],
 [ "1-10,21-30,41-50", -10, 	10, "41-50"    	    	],
 [ "1-10,21-30,41-50", -19, 	10, "22-30,41"	    	],
 [ "1-10,21-30,41-50", -30, 	10, "1-10"		],
 [ "1-10,21-30,41-50", -40, 	10, "1-10"		],

 [ "1-10,21-30,41-50", 	-5, 	 1, "46"   	    	],
 [ "1-10,21-30,41-50", 	-5, 	 2, "46-47"	    	],
 [ "1-10,21-30,41-50", 	-5, 	 3, "46-48"	    	],
 [ "1-10,21-30,41-50", 	-5, 	 5, "46-50"	    	],
 [ "1-10,21-30,41-50", 	-5, 	 6, "46-50"	    	],
 [ "1-10,21-30,41-50", 	-5, 	10, "46-50"	    	],

 [ "1-10,21-30,41-50", -15, 	10, "26-30,41-45" 	],
 [ "1-10,21-30,41-50", -15, 	11, "26-30,41-46"  	],
 [ "1-10,21-30,41-50", -15, 	20, "26-30,41-50" 	],
 [ "1-10,21-30,41-50", -15, 	21, "26-30,41-50" 	],
 [ "1-10,21-30,41-50", -15, 	30, "26-30,41-50" 	],

 [ "1-10,21-30,41-50", -25, 	 1, "6" 	   	],
 [ "1-10,21-30,41-50", -25, 	 2, "6-7" 	    	],
 [ "1-10,21-30,41-50", -25, 	 3, "6-8" 	    	],
 [ "1-10,21-30,41-50", -25, 	 5, "6-10" 	    	],
 [ "1-10,21-30,41-50", -25, 	 6, "6-10,21" 	    	],
 [ "1-10,21-30,41-50", -25, 	10, "6-10,21-25" 	],

 # negative offset, negative length
 [ "1-10,21-30,41-50", 	-1, 	-1, "-"   	     	],
 [ "1-10,21-30,41-50", 	-9, 	-1, "42-49"    		],
 [ "1-10,21-30,41-50", -10, 	-1, "41-49"    		],
 [ "1-10,21-30,41-50", -19, 	-1, "22-30,41-49"       ],
 [ "1-10,21-30,41-50", -20, 	-1, "21-30,41-49"       ],
 [ "1-10,21-30,41-50", -29, 	-1, "2-10,21-30,41-49"  ],
 [ "1-10,21-30,41-50", -31, 	-1, "1-10,21-30,41-49"  ],

 [ "1-10,21-30,41-50", 	-5, 	-1, "46-49"	       	],
 [ "1-10,21-30,41-50", 	-5, 	-2, "46-48"	       	],
 [ "1-10,21-30,41-50", 	-5, 	-4, "46"	 	],
 [ "1-10,21-30,41-50", 	-5, 	-5, "-" 		],
 [ "1-10,21-30,41-50", 	-5, 	-7, "-" 		],

 [ "1-10,21-30,41-50", -15,    -10, "26-30" 	    	],
 [ "1-10,21-30,41-50", -15,    -11, "26-29" 	    	],
 [ "1-10,21-30,41-50", -15,    -20, "-" 		],
 [ "1-10,21-30,41-50", -15,    -21, "-" 		],
 [ "1-10,21-30,41-50", -15,    -30, "-" 		],

 [ "1-10,21-30,41-50", -25,     -1, "6-10,21-30,41-49"  ],
 [ "1-10,21-30,41-50", -25,     -2, "6-10,21-30,41-48"  ],
 [ "1-10,21-30,41-50", -25,     -9, "6-10,21-30,41"   	],
 [ "1-10,21-30,41-50", -25,    -10, "6-10,21-30"   	],
 [ "1-10,21-30,41-50", -25,    -11, "6-10,21-29"   	],
 [ "1-10,21-30,41-50", -25,    -24, "6"		   	],
 [ "1-10,21-30,41-50", -25,    -25, "-"		   	],

 [ "1-10,21-30,41-50", -30,    -10, "1-10,21-30"  	],	
 [ "1-10,21-30,41-50", -30,    -11, "1-10,21-29" 	],
 [ "1-10,21-30,41-50", -30,    -20, "1-10" 	    	],
 [ "1-10,21-30,41-50", -30,    -21, "1-9" 		],
 [ "1-10,21-30,41-50", -30,    -30, "-" 		],

 [ "1-10,21-30,41-50", -35,    -10, "1-10,21-30"  	],	
 [ "1-10,21-30,41-50", -35,    -11, "1-10,21-29" 	],
 [ "1-10,21-30,41-50", -35,    -20, "1-10" 	    	],
 [ "1-10,21-30,41-50", -35,    -21, "1-9" 		],
 [ "1-10,21-30,41-50", -35,    -30, "-" 		],

);

my @Slice_die = 
(
 [ "(-0"    ,  0,  1, "<die>" ],
 [ "0-)"    , -2, -1, "<die>" ],
);

my @Slice_test = 
(
 # empty sets
 [ "-"	 	     ,   0,      0, "-"    	     	],
 [ "-"	 	     ,   0, 	 1, "-"    	     	],
 [ "-"	 	     ,  -2, 	-1, "-"    	     	],

 # infinite sets
 [ "0-)"             ,   0,      0, "0"			],
 [ "0-)"             ,   0,      1, "0-1"		],
 [ "0-)"             ,   0,      9, "0-9"		],
 [ "0-)"             ,   5,      4, "-"			],
 [ "0-)"             ,   5,      5, "5"			],
 [ "0-)"             ,   5,     14, "5-14"		],
 [ "1-10,21-30,41-)" , 	 5,     24, "6-10,21-30,41-45"  ],
 [ "1-10,21-30,41-)" , 	15,     24, "26-30,41-45"  	],

 [ "(-0"             ,  -1,      0, "0"			],
 [ "(-0"             ,  -2,     -1, "-1-0"		],
 [ "(-0"             , -10,     -6, "-9--5"		],
 [ "(-0"             , -10,     -4, "-9--3"		],
 [ "(-10,21-30,41-50", -15,     -6, "26-30,41-45"  	],
 [ "(-10,21-30,41-50", -15,    -11, "26-30"  		],

 # empty slices
 [ "1-10"	     ,  10,     11, "-"    	     	],
 [ "1-10"	     ,   5,  	 4, "-"    	     	],
 [ "1-10"	     ,  -5,  	-6, "-"    	     	],
 [ "1-10"	     , -12,    -11, "-"    	     	],

 # positive indices
 [ "1-10"	     ,   0, 	 2, "1-3"  	     	],
 [ "1-10"	     ,   5, 	 7, "6-8"  	     	],
 [ "1-10"	     ,   7, 	 9, "8-10" 	     	],
 [ "1-10"	     ,   9, 	 9, "10"   	     	],
 [ "1-10"	     ,  10, 	10, "-"    	     	],
 [ "1-10"	     ,   0, 	 9, "1-10" 	     	],
 [ "1-10"	     ,   0, 	20, "1-10" 	     	],

 # negative indices
 [ "1-10"	     ,  -2, 	-1, "9-10" 	     	],
 [ "1-10"	     ,  -5, 	-4, "6-7"  	     	],
 [ "1-10"	     , -10, 	-8, "1-3"  	     	],
 [ "1-10"	     , -10, 	-1, "1-10" 	     	],
 [ "1-10"	     , -10, 	20, "1-10" 	     	],

);


print "1..", @At_die + @At_test + @Splice_die + @Splice_test + @Slice_die + @Slice_test, "\n";


for my $test (@At_die)
{
    my($run_list, $i) = @$test;

    eval { Set::IntSpan->new($run_list)->at($i) };
    $@ or Not; OK("at", $test);
}

for my $test (@At_test)
{
    my($run_list, $i, $n) = @$test;

    equal(Set::IntSpan->new($run_list)->at($i), $n) or Not; OK("at", $test);
}

sub equal
{
    my($a, $b) = @_;

    not defined $a and not defined $b or
        defined $a and     defined $b and $a == $b
}

for my $test (@Splice_die)
{
    my($run_list, $offset, $length) = @$test;

    eval { Set::IntSpan->new($run_list)->_splice($offset, $length) };
    $@ or Not; OK("splice", $test);
}

for my $test (@Splice_test)
{
    my($run_list, $offset, $length, $expected) = @$test;

    my $actual = Set::IntSpan->new($run_list)->_splice($offset, $length)->run_list;
    $actual eq $expected or Not; OK("splice", $test);
#   $actual eq $expected or print "\t$actual\n";
}

for my $test (@Slice_die)
{
    my($run_list, $offset, $length) = @$test;

    eval { Set::IntSpan->new($run_list)->slice($offset, $length) };
    $@ or Not; OK("slice", $test);
}

for my $test (@Slice_test)
{
    my($run_list, $offset, $length, $expected) = @$test;

    my $actual = Set::IntSpan->new($run_list)->slice($offset, $length)->run_list;
    $actual eq $expected or Not; OK("slice", $test);
#   $actual eq $expected or print "\t$actual\n";
}
