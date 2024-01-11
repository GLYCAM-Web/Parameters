#!/usr/bin/perl -wl

use strict;
use Shell qw(cp);

#Declare variables.
my @FILES;
my $file;
my $trk_sub; #check number of branches on a sugar
my $inputfile = "header.in";
my $run_tleap;
my @RES; my $i; my $j;
my @PREP;
my $head; my $tail;
my $chk = 0; #controls printing of text to Error_files (see script below)

my $tleap = "/usr/local/programs/amber8/exe/tleap";

#Get all prep files
chdir "./ALL_PREPS";
@FILES = <*prep>;
chdir "../";

foreach $file (@FILES)
{

#open input file (leap.in)
open(INFIL,">$inputfile");

	$i = 0;
	$j = 0;

        open(FL,"$file");
        while(<FL>)
        {
                if($_ =~ /INT/)
                {
                        $PREP[$j] = substr($_,0,3);
                        $j++;
                }
        }


	($head,$tail)=split(/\./, $file);
	mkdir "$head";

	#make leap input header
	print INFIL "source /home/ayongye/GLYCAM06/1004leaprc.Glycam_04";
	print INFIL "loadamberparams /home/ayongye/GLYCAM06/Glycam_06a.dat";
	print INFIL "loadamberprep /home/ayongye/GLYCAM06/aglycon_04.prep";
	print INFIL "loadamberprep ../"."$file\n";

	#open prepfile
	open(FIL, "$file");
	while(<FIL>)
	{
		chomp;
		if($_ =~ /INT/)
		{
			$RES[$i] = substr($_,0,3);
			$trk_sub = substr($_,0,1);

			#check number of branches
                        if($trk_sub =~ /0/)
                        {
                        	my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
				print INF "check x";
				print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if(($trk_sub =~ /1/)or(($trk_sub =~ /2/)and($RES[$i] =~ /SA/)))
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {$RES[$i] $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if(($trk_sub =~ /2/)and($RES[$i] !~ /SA/))
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i] $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if(($trk_sub =~ /3/)or($trk_sub =~ /4/)or($trk_sub =~ /6/)or($trk_sub =~ /7/)
					    or($trk_sub =~ /8/)or($trk_sub =~ /9/))
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i] $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if(($trk_sub =~ /X/)or($trk_sub =~ /Y/)or($trk_sub =~ /Z/))
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O2";
                                print INF "x = sequence {x $PREP[1]}";

				if($trk_sub =~ /X/)
				{
					print INF "set x tail x."."$RES[$i]".".O6";
				}
				elsif($trk_sub =~ /Y/)
                                {
                                        print INF "set x tail x."."$RES[$i]".".O4";
                                }
                                elsif($trk_sub =~ /Z/)
                                {
                                        print INF "set x tail x."."$RES[$i]".".O3";
                                }

                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if(($trk_sub =~ /V/)or($trk_sub =~ /W/))
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
				print INF "set x tail x."."$RES[$i]".".O3";
				print INF "x = sequence {x $PREP[1]}";

				if($trk_sub =~ /V/)
				{
					print INF "set x tail x."."$RES[$i]".".O6";
				}
                                elsif($trk_sub =~ /W/)
                                {
                                        print INF "set x tail x."."$RES[$i]".".O4";
                                }

				print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /U/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
				print INF "set x tail x."."$RES[$i]".".O6";
				print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if(($trk_sub =~ /S/)or($trk_sub =~ /T/))
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O2";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O3";
                                print INF "x = sequence {x $PREP[1]}";

				if($trk_sub =~ /S/)
				{
                                	print INF "set x tail x."."$RES[$i]".".O6";
				}
                                elsif($trk_sub =~ /T/)
                                {
                                        print INF "set x tail x."."$RES[$i]".".O4";
                                }

                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /R/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O2";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O6";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /Q/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O3";
                                print INF "x = sequence {x $PREP[1]}";
				print INF "set x tail x."."$RES[$i]".".O4";
				print INF "x = sequence {x $PREP[1]}";
				print INF "set x tail x."."$RES[$i]".".O6";
				print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /P/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O2";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O3";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O6";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /K/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O7";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /J/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O8";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /I/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O9";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /H/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O7";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O8";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /G/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O7";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O9";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /F/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O8";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O9";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /E/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O7";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O8";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /D/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O7";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O9";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /C/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O8";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O9";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /B/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O7";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O8";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O9";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

                        if($trk_sub =~ /A/)
                        {
                                my $inf = "inputfile";
                                open(INF,">$inf");
                                print INF "x = sequence {OME $RES[$i]}";
                                print INF "set x tail x."."$RES[$i]".".O4";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O7";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O8";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "set x tail x."."$RES[$i]".".O9";
                                print INF "x = sequence {x $PREP[1]}";
                                print INF "savepdb x "."$RES[$i]".".pdb";
                                print INF "saveamberparm x "."$RES[$i]".".top "."$RES[$i]".".crd";
                                print INF "check x";
                                print INF "charge x";
                                print INF "Quit";
                                cp("$inputfile","./$head/$RES[$i]"."_leapinput");
                                my $cat = "cat inputfile >> ./$head/$RES[$i]"."_leapinput";
                                system("$cat");
                                chdir "$head";
                                $run_tleap = $tleap." -f "."$RES[$i]"."_leapinput ".">$RES[$i]"."_leapoutput" ;
                                system("$run_tleap");
                                chdir "../";
                        }

			$i++;

		}#end if($_ =~ /INT/)
	}#end while(<FIL>)
	
#check for WARNINGS and ERRORS in leap log files
	my $errorfiles = "000_ERROR_FILES";
	my $spec_errs = "000_FILE_SPECIFIC_ERRORS";
	my $log;

#Go to each generated prepfile directory
	chdir "$head";
	my @LOG = <*leapoutput>;
#	$chk = 0; #controls printing of text to Error_files

	foreach $log (@LOG)
	{
		open(LG,"$log");
		while(<LG>)
		{
			chomp;
			if($_ =~ /ERROR/)
			{
				
				open(SPERROR,">>$spec_errs");
				print SPERROR "$file: "."$log: $_";

				if($chk == 0)
				{
					chdir "../";
					open(ERROR,">>$errorfiles");

					my $fsize = -s "000_ERROR_FILES";
					if($fsize == 0)#check file size
					{
						print ERROR "Problems with these files. Check directories for specific errors:";
					}

					print ERROR "$file";
					$chk++;
				}

				chdir "$head";

			}#end if(WARNING or ERROR)
		}
	}#end foreach $log

	chdir "../";

}#end foreach $file

	if($chk > 0)
	{
		print "";
		print "Prep files have errors. Look at 000_ERROR_FILES for more info.";
		print "";
	}

unlink ('inputfile', 'header.in');
