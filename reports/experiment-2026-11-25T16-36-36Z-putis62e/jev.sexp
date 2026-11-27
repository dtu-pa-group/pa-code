(analysis-summary
  :config (analysis-config
    :cmd (/Users/gtserve/Code/pa-code/.venv/bin/python3 /Users/gtserve/Code/pa-code/experiment.py _analyze jev /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25T16-36-36Z-putis62e/jev-selections.json /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25T16-36-36Z-putis62e/jev-analysis-times.jsonl)
    :analysis (analysis-info
      :name evaluation-jev
      :version 1.0
      :group "Los Pollos Hermanos"
      :tags (python)
      :system macOS-26.6.2-arm64-arm-64bit-Mach-O
    )
    :experiments (
      :"jpamb.cases.Arrays.arrayContent:()V" ()
      :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ()
      :"jpamb.cases.Arrays.arrayInBounds:()V" ()
      :"jpamb.cases.Arrays.arrayIsNull:()V" ()
      :"jpamb.cases.Arrays.arrayIsNullLength:()V" ()
      :"jpamb.cases.Arrays.arrayLength:()V" ()
      :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ()
      :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ()
      :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ()
      :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ()
      :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ()
      :"jpamb.cases.Arrays.binarySearch:(I)V" ()
      :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ()
      :"jpamb.cases.Calls.callsAssertFalse:()V" ()
      :"jpamb.cases.Calls.callsAssertFib:(I)V" ()
      :"jpamb.cases.Calls.callsAssertIf:(Z)V" ()
      :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ()
      :"jpamb.cases.Calls.callsAssertTrue:()V" ()
      :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.divisionLoop:(I)V" ()
      :"jpamb.cases.Dependent.normalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.safeDivByN:(I)I" ()
      :"jpamb.cases.Loops.forever:()V" ()
      :"jpamb.cases.Loops.neverAsserts:()V" ()
      :"jpamb.cases.Loops.neverDivides:()I" ()
      :"jpamb.cases.Loops.terminates:()V" ()
      :"jpamb.cases.Simple.assertBoolean:(Z)V" ()
      :"jpamb.cases.Simple.assertFalse:()V" ()
      :"jpamb.cases.Simple.assertInteger:(I)V" ()
      :"jpamb.cases.Simple.assertPositive:(I)V" ()
      :"jpamb.cases.Simple.assertTrue:()V" ()
      :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ()
      :"jpamb.cases.Simple.divideByZero:()I" ()
      :"jpamb.cases.Simple.divideZeroByZero:(II)I" ()
      :"jpamb.cases.Simple.doNothing:()V" ()
      :"jpamb.cases.Simple.earlyReturn:()I" ()
      :"jpamb.cases.Simple.justAdd:(II)I" ()
      :"jpamb.cases.Simple.justMulitply:(II)I" ()
      :"jpamb.cases.Simple.justReturn:()I" ()
      :"jpamb.cases.Simple.justReturnNothing:()V" ()
      :"jpamb.cases.Simple.multiError:(Z)I" ()
      :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Tricky.collatz:(I)V" ()
    )
    :iterations 3
    :timeout 5.0
  )
  :results (
    :"jpamb.cases.Arrays.arrayContent:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 354155625
          :relative 2.16778562995744
        )
        :calibrates (2509834 2303417)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 354362208
          :relative 2.1794318958303878
        )
        :calibrates (2375542 2313083)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 362126500
          :relative 2.1868424721055915
        )
        :calibrates (2393917 2316375)
      ))
    :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 417621791
          :relative 2.247691027332734
        )
        :calibrates (2399375 2322583)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 429403375
          :relative 2.260452163347079
        )
        :calibrates (2398792 2315791)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 425235709
          :relative 2.260145176241823
        )
        :calibrates (2360584 2311542)
      ))
    :"jpamb.cases.Arrays.arrayInBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 59436667
          :relative 1.4021635000371468
        )
        :calibrates (2386791 2322125)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53027917
          :relative 1.3474715673940059
        )
        :calibrates (2355792 2409209)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52861875
          :relative 1.3486005104509506
        )
        :calibrates (2373791 2363958)
      ))
    :"jpamb.cases.Arrays.arrayIsNull:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" yes
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 51941209
          :relative 1.3405576046456433
        )
        :calibrates (2379500 2362750)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" yes
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 51787917
          :relative 1.3422721107883544
        )
        :calibrates (2404750 2304875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" yes
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 52806625
          :relative 1.3515166082586199
        )
        :calibrates (2393875 2307250)
      ))
    :"jpamb.cases.Arrays.arrayIsNullLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" yes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 77612375
          :relative 1.5207886181925456
        )
        :calibrates (2356042 2323166)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" yes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 144133333
          :relative 1.6608619595699183
        )
        :calibrates (2370583 3923500)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" yes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 79395500
          :relative 1.5257582038245499
        )
        :calibrates (2364958 2367292)
      ))
    :"jpamb.cases.Arrays.arrayLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 122253917
          :relative 1.7114392864314476
        )
        :calibrates (2403666 2348083)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 137301375
          :relative 1.6855241340611222
        )
        :calibrates (3278917 2385833)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 123645041
          :relative 1.7224778223999926
        )
        :calibrates (2377875 2307333)
      ))
    :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 88682959
          :relative 1.5773734413685525
        )
        :calibrates (2389708 2303791)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 90133750
          :relative 1.5753288541873844
        )
        :calibrates (2496250 2296542)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 89651209
          :relative 1.5788360265444634
        )
        :calibrates (2403916 2324875)
      ))
    :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 57800042
          :relative 1.3905447574530252
        )
        :calibrates (2371041 2332375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 59043583
          :relative 1.4009527282478178
        )
        :calibrates (2386375 2304458)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 58917666
          :relative 1.3989659355969222
        )
        :calibrates (2402500 2299792)
      ))
    :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" yes
            :ok no
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 107616750
          :relative 1.6623123602278422
        )
        :calibrates (2372291 2311500)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" yes
            :ok no
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 112698958
          :relative 1.6814299419497574
        )
        :calibrates (2398958 2294792)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" yes
            :ok no
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 110831750
          :relative 1.671552936411044
        )
        :calibrates (2414250 2307916)
      ))
    :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 115744625
          :relative 1.6906464322749764
        )
        :calibrates (2417333 2302041)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 117654333
          :relative 1.7015544955014419
        )
        :calibrates (2358625 2319625)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 117946042
          :relative 1.7010238455773186
        )
        :calibrates (2389583 2306000)
      ))
    :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 319153666
          :relative 2.134393568858004
        )
        :calibrates (2381334 2302875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 320368500
          :relative 2.131975514531349
        )
        :calibrates (2420667 2307625)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 320986041
          :relative 2.1347796017475447
        )
        :calibrates (2391333 2315584)
      ))
    :"jpamb.cases.Arrays.binarySearch:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 404694167
          :relative 2.2358205632800146
        )
        :calibrates (2377166 2325416)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 405884000
          :relative 2.2408402821195055
        )
        :calibrates (2354375 2307833)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 412446459
          :relative 2.2409935842584674
        )
        :calibrates (2415875 2320041)
      ))
    :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 60272584
          :relative 1.399181553827315
        )
        :calibrates (2359084 2448958)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 56905167
          :relative 1.3803614863634721
        )
        :calibrates (2411041 2329416)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 56465291
          :relative 1.381754489171255
        )
        :calibrates (2372125 2316625)
      ))
    :"jpamb.cases.Calls.callsAssertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 85194125
          :relative 1.5602821716228372
        )
        :calibrates (2386875 2302959)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 87249375
          :relative 1.5731580134698187
        )
        :calibrates (2345125 2317541)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 87264375
          :relative 1.5657986539823103
        )
        :calibrates (2361250 2381916)
      ))
    :"jpamb.cases.Calls.callsAssertFib:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 346662084
          :relative 2.1738882626829117
        )
        :calibrates (2340584 2305083)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 354787625
          :relative 2.174327707467949
        )
        :calibrates (2409625 2340125)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 350904000
          :relative 2.177657596831721
        )
        :calibrates (2352792 2309084)
      ))
    :"jpamb.cases.Calls.callsAssertIf:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 50404792
          :relative 1.3294257838254069
        )
        :calibrates (2407541 2313916)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 51067000
          :relative 1.3404040707158957
        )
        :calibrates (2360333 2303750)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 51634542
          :relative 1.335865678553924
        )
        :calibrates (2362375 2403083)
      ))
    :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 90814292
          :relative 1.5838603615751816
        )
        :calibrates (2389750 2345292)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 91625750
          :relative 1.588584422959014
        )
        :calibrates (2393292 2332375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 90931708
          :relative 1.5885956522507498
        )
        :calibrates (2390500 2299250)
      ))
    :"jpamb.cases.Calls.callsAssertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 65890625
          :relative 1.448591985559262
        )
        :calibrates (2386792 2304167)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 66713666
          :relative 1.4487264083964997
        )
        :calibrates (2431542 2316542)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 66147167
          :relative 1.4490931351531506
        )
        :calibrates (2397125 2306667)
      ))
    :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 140444875
          :relative 1.7817021327684892
        )
        :calibrates (2345125 2298250)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 139573209
          :relative 1.776561586621225
        )
        :calibrates (2359542 2309959)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 139309458
          :relative 1.7724086045781489
        )
        :calibrates (2394209 2311250)
      ))
    :"jpamb.cases.Dependent.divisionLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 248178834
          :relative 2.0201653072112284
        )
        :calibrates (2409000 2329375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 248554916
          :relative 2.022640662099157
        )
        :calibrates (2369084 2349500)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 249318833
          :relative 2.0303282055312084
        )
        :calibrates (2350292 2299750)
      ))
    :"jpamb.cases.Dependent.normalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 146080500
          :relative 1.7919524071066946
        )
        :calibrates (2400709 2316334)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 148359750
          :relative 1.8029710888942652
        )
        :calibrates (2349542 2321083)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 148957500
          :relative 1.8060211983062142
        )
        :calibrates (2352291 2304333)
      ))
    :"jpamb.cases.Dependent.safeDivByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 78125125
          :relative 1.5256639409929518
        )
        :calibrates (2341334 2316208)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 79309916
          :relative 1.5296247162271666
        )
        :calibrates (2377125 2308125)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 78600500
          :relative 1.5260432819443652
        )
        :calibrates (2390583 2291208)
      ))
    :"jpamb.cases.Loops.forever:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 49435583
          :relative 1.3229179302841503
        )
        :calibrates (2383875 2316708)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 50680125
          :relative 1.3194250922614346
        )
        :calibrates (2396375 2461458)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 50221000
          :relative 1.3314840351916626
        )
        :calibrates (2376916 2305083)
      ))
    :"jpamb.cases.Loops.neverAsserts:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 693185791
          :relative 2.4673438445378824
        )
        :calibrates (2413583 2312875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 701182791
          :relative 2.4757385012372106
        )
        :calibrates (2386792 2302667)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 713658000
          :relative 2.48466504350608
        )
        :calibrates (2368500 2307291)
      ))
    :"jpamb.cases.Loops.neverDivides:()I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 717308417
          :relative 2.4722833084014755
        )
        :calibrates (2395125 2440500)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 723803833
          :relative 2.4801303491497184
        )
        :calibrates (2399791 2392250)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 720604875
          :relative 2.489821178578508
        )
        :calibrates (2348209 2317375)
      ))
    :"jpamb.cases.Loops.terminates:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 106945958
          :relative 1.6606141105408252
        )
        :calibrates (2377166 2295667)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 108323166
          :relative 1.6649066112350706
        )
        :calibrates (2367667 2318791)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 109205125
          :relative 1.6702584798169176
        )
        :calibrates (2359667 2307083)
      ))
    :"jpamb.cases.Simple.assertBoolean:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 54793708
          :relative 1.3596102638483536
        )
        :calibrates (2360625 2427334)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53261417
          :relative 1.3531365925160506
        )
        :calibrates (2407375 2316584)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53220292
          :relative 1.3582750581895184
        )
        :calibrates (2343791 2321000)
      ))
    :"jpamb.cases.Simple.assertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 49290500
          :relative 1.3206609405210545
        )
        :calibrates (2391542 2319666)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 50516500
          :relative 1.3375164270496045
        )
        :calibrates (2349542 2295042)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 50250083
          :relative 1.3331483343871533
        )
        :calibrates (2365042 2301750)
      ))
    :"jpamb.cases.Simple.assertInteger:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 77221708
          :relative 1.5156754699897235
        )
        :calibrates (2405542 2305250)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 77945333
          :relative 1.522037105885438
        )
        :calibrates (2380500 2305292)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 78326708
          :relative 1.5259602328845407
        )
        :calibrates (2343250 2323125)
      ))
    :"jpamb.cases.Simple.assertPositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85286250
          :relative 1.5621234978768834
        )
        :calibrates (2374750 2300292)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87681000
          :relative 1.5752351497962989
        )
        :calibrates (2346000 2317375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85855625
          :relative 1.558783717956173
        )
        :calibrates (2436084 2306500)
      ))
    :"jpamb.cases.Simple.assertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 49577666
          :relative 1.3295564897706467
        )
        :calibrates (2347041 2295541)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 50241084
          :relative 1.3306306692386638
        )
        :calibrates (2388917 2304167)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 50300041
          :relative 1.3277715349008106
        )
        :calibrates (2406667 2322959)
      ))
    :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102959500
          :relative 1.644154825122482
        )
        :calibrates (2363542 2308875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104672083
          :relative 1.6462982296101971
        )
        :calibrates (2392792 2333958)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103610917
          :relative 1.6402907411697036
        )
        :calibrates (2401917 2342084)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 80369917
          :relative 1.5362140925165426
        )
        :calibrates (2362334 2314042)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 80714500
          :relative 1.5379870730125582
        )
        :calibrates (2351875 2325417)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 81040333
          :relative 1.53844263514301
        )
        :calibrates (2391625 2299625)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87169083
          :relative 1.5686405244359127
        )
        :calibrates (2409625 2297459)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89958709
          :relative 1.58060632669285
        )
        :calibrates (2420333 2305375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89331959
          :relative 1.583464491251992
        )
        :calibrates (2362792 2299209)
      ))
    :"jpamb.cases.Simple.divideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52330750
          :relative 1.3468005343405873
        )
        :calibrates (2405209 2304417)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53353875
          :relative 1.3603112648507543
        )
        :calibrates (2349791 2304834)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53228167
          :relative 1.353244781995797
        )
        :calibrates (2395167 2324667)
      ))
    :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 79369167
          :relative 1.530169252647712
        )
        :calibrates (2392542 2290333)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 79303667
          :relative 1.5350159753277028
        )
        :calibrates (2336000 2291083)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 79995167
          :relative 1.5335694945274005
        )
        :calibrates (2354417 2328584)
      ))
    :"jpamb.cases.Simple.divideByZero:()I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 51743875
          :relative 1.3446584964083672
        )
        :calibrates (2383542 2296292)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52489750
          :relative 1.3484103125270703
        )
        :calibrates (2388708 2317750)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" maybe
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52427875
          :relative 1.349053051610342
        )
        :calibrates (2365291 2328667)
      ))
    :"jpamb.cases.Simple.divideZeroByZero:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53504792
          :relative 1.3564823649171107
        )
        :calibrates (2389959 2319167)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 54297666
          :relative 1.3624292259445683
        )
        :calibrates (2395958 2317959)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 54536458
          :relative 1.3660427558878996
        )
        :calibrates (2386125 2309292)
      ))
    :"jpamb.cases.Simple.doNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52280708
          :relative 1.3338312409179125
        )
        :calibrates (2414250 2433500)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52419917
          :relative 1.346607329488095
        )
        :calibrates (2396875 2322875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52121917
          :relative 1.344964191276366
        )
        :calibrates (2416625 2294083)
      ))
    :"jpamb.cases.Simple.earlyReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52061625
          :relative 1.3487659881926921
        )
        :calibrates (2352458 2311791)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52513459
          :relative 1.3483142931955705
        )
        :calibrates (2388792 2320833)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52582792
          :relative 1.3558668156195963
        )
        :calibrates (2348042 2286500)
      ))
    :"jpamb.cases.Simple.justAdd:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52080709
          :relative 1.3433012103026667
        )
        :calibrates (2359625 2365417)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52355875
          :relative 1.3379519294776392
        )
        :calibrates (2417042 2391833)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52346292
          :relative 1.3484961821038277
        )
        :calibrates (2398208 2294459)
      ))
    :"jpamb.cases.Simple.justMulitply:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 51920042
          :relative 1.3424843161500934
        )
        :calibrates (2410167 2309167)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52426500
          :relative 1.3464241602938534
        )
        :calibrates (2423125 2299209)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52430250
          :relative 1.3463288807118647
        )
        :calibrates (2395458 2328250)
      ))
    :"jpamb.cases.Simple.justReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 51873083
          :relative 1.343227857768516
        )
        :calibrates (2411125 2295875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52185542
          :relative 1.3463746075150798
        )
        :calibrates (2353708 2347458)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52533625
          :relative 1.3497739591235196
        )
        :calibrates (2395125 2300500)
      ))
    :"jpamb.cases.Simple.justReturnNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 51479292
          :relative 1.3445718971854745
        )
        :calibrates (2353208 2303625)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52622500
          :relative 1.3516735124061012
        )
        :calibrates (2350166 2332875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52089916
          :relative 1.3480523907567434
        )
        :calibrates (2356750 2317708)
      ))
    :"jpamb.cases.Simple.multiError:(Z)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" yes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52026000
          :relative 1.3490237239388077
        )
        :calibrates (2355667 2302625)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" yes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53215500
          :relative 1.354958734529114
        )
        :calibrates (2393958 2306167)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" yes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 55574500
          :relative 1.3640653187758573
        )
        :calibrates (2396708 2409917)
      ))
    :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114593208
          :relative 1.6925413252622907
        )
        :calibrates (2351667 2300417)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113585667
          :relative 1.6850264412184572
        )
        :calibrates (2386125 2305541)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 117250084
          :relative 1.6657424362200304
        )
        :calibrates (2528916 2534000)
      ))
    :"jpamb.cases.Tricky.collatz:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 266625958
          :relative 2.053880813625398
        )
        :calibrates (2398708 2311625)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 263696500
          :relative 2.0513320769159478
        )
        :calibrates (2391625 2294375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" maybe
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 273943041
          :relative 2.0572078833459666
        )
        :calibrates (2504041 2298625)
      ))
  )
)