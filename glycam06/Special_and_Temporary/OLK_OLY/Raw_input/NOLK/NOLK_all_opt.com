%chk=NLYS_all_opt.chk
%mem=8GB
%nproc=8
# opt=z-matrix HF/6-31G* scf=tight

Title Card Required

2 1
 N
 H                  1              B1
 H                  1              B2    2              A1
 H                  1              B3    2              A2    3              D1
 C                  1              B4    2              A3    3              D2
 H                  5              B5    1              A4    2              D3
 C                  5              B6    1              A5    6              D4
 H                  7              B7    5              A6    6              D5
 H                  7              B8    5              A7    6              D6
 C                  7              B9    5              A8    6              D7
 H                 10             B10    7              A9    5              D8
 H                 10             B11    7             A10    5              D9
 C                 10             B12    7             A11    5             D10
 H                 13             B13   10             A12    7             D11
 C                 13             B14   10             A13    7             D12
 H                 15             B15   13             A14   10             D13
 H                 15             B16   13             A15   10             D14
 N                 15             B17   13             A16   10             D15
 H                 18             B18   15             A17   13             D16
 H                 18             B19   15             A18   13             D17
 H                 18             B20   15             A19   13             D18
 O                 13             B21   10             A20    7             D19
 C                 22             B22   13             A21   10             D20
 H                 23             B23   22             A22   13             D21
 H                 23             B24   22             A23   13             D22
 H                 23             B25   22             A24   13             D23
 C                  5             B26    7             A25   10             D24
 O                 27             B27    5             A26    7             D25
 N                 27             B28    5             A27    7             D26
 H                 29             B29   27             A28    5             D27
 C                 29             B30   27             A29    5             D28
 H                 31             B31   29             A30   27             D29
 H                 31             B32   29             A31   27             D30
 H                 31             B33   29             A32   27             D31

   B1             1.07000000
   B2             1.07000000
   B3             1.07000000
   B4             1.54000000
   B5             1.08386286
   B6             1.53581757
   B7             1.08103234
   B8             1.08510963
   B9             1.53268980
   B10            1.08266434
   B11            1.08631103
   B12            1.53445616
   B13            1.09069252
   B14            1.52579825
   B15            1.07919177
   B16            1.07989186
   B17            1.50775633
   B18            1.00987147
   B19            1.00939347
   B20            1.01470519
   B21            1.40316281
   B22            1.41562564
   B23            1.08510038
   B24            1.07908786
   B25            1.08072236
   B26            1.53228031
   B27            1.20445732
   B28            1.34085854
   B29            0.99405887
   B30            1.45178336
   B31            1.08359146
   B32            1.07984344
   B33            1.08083528
   A1           109.47125080
   A2           109.47121829
   A3           109.47120255
   A4           105.94396175
   A5           112.79929115
   A6           106.94525837
   A7           109.66576265
   A8           112.76832559
   A9           108.12586017
   A10          110.68613880
   A11          114.13519068
   A12          110.25741920
   A13          109.31941908
   A14          112.98058627
   A15          110.61323943
   A16          108.43961452
   A17          111.93353488
   A18          112.79850359
   A19          107.07534860
   A20          115.08289590
   A21          118.06981527
   A22          110.55572149
   A23          106.43491854
   A24          111.39371819
   A25          111.89275924
   A26          120.73902759
   A27          116.07425883
   A28          118.41542244
   A29          121.62722842
   A30          111.57647261
   A31          109.81710156
   A32          108.57061214
   D1          -120.00001416
   D2           119.99998525
   D3            42.58159448
   D4           118.27520941
   D5            79.47090671
   D6          -164.04037032
   D7           -41.59462954
   D8           -68.98164689
   D9            47.91124238
   D10          168.69837056
   D11           27.51836164
   D12          147.54554463
   D13          -70.70012867
   D14           53.10689404
   D15          169.19328006
   D16           71.43858323
   D17         -166.72089595
   D18          -46.15770042
   D19          -96.63932728
   D20           64.00118564
   D21           54.89257652
   D22          173.57941667
   D23          -67.38617479
   D24           75.53129354
   D25          -17.02214533
   D26          164.07940980
   D27            5.98419231
   D28          173.95112520
   D29          -70.53816881
   D30           49.95743072
   D31          169.16692877

