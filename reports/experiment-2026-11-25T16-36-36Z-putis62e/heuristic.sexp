(analysis-summary
  :config (analysis-config
    :cmd (/Users/gtserve/Code/pa-code/.venv/bin/python3 /Users/gtserve/Code/pa-code/experiment.py _analyze heuristic /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25T16-36-36Z-putis62e/heuristic-selections.json /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25T16-36-36Z-putis62e/heuristic-analysis-times.jsonl)
    :analysis (analysis-info
      :name evaluation-heuristic
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
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 56417334
          :relative 1.3813777904428097
        )
        :calibrates (2368458 2320375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 56548667
          :relative 1.3834850905381544
        )
        :calibrates (2350416 2326583)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok maybe
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 56129417
          :relative 1.366794502489107
        )
        :calibrates (2395083 2429125)
      ))
    :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 55939250
          :relative 1.374766269225282
        )
        :calibrates (2376792 2343625)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 55274833
          :relative 1.3649518414303232
        )
        :calibrates (2419833 2351125)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 55150084
          :relative 1.3641677936607275
        )
        :calibrates (2415375 2353417)
      ))
    :"jpamb.cases.Arrays.arrayInBounds:()V" ((analysis-result
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
          :absolute 53420541
          :relative 1.3599913754986896
        )
        :calibrates (2345541 2318334)
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
          :absolute 54357375
          :relative 1.3623733410597625
        )
        :calibrates (2411417 2308291)
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
          :absolute 53031583
          :relative 1.35043579006672
        )
        :calibrates (2415250 2317666)
      ))
    :"jpamb.cases.Arrays.arrayIsNull:()V" ((analysis-result
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
          :absolute 53385750
          :relative 1.3579582667457077
        )
        :calibrates (2375458 2307250)
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
          :absolute 53214583
          :relative 1.3560190504034493
        )
        :calibrates (2386250 2302333)
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
          :absolute 52911541
          :relative 1.3522516015854322
        )
        :calibrates (2408375 2294125)
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
          :absolute 53464791
          :relative 1.3546807987894265
        )
        :calibrates (2405833 2319333)
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
          :absolute 53286375
          :relative 1.3495415261652766
        )
        :calibrates (2390250 2375208)
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
          :absolute 52788875
          :relative 1.3456119537707822
        )
        :calibrates (2364584 2399292)
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
          :absolute 53533209
          :relative 1.3605340555668521
        )
        :calibrates (2341084 2326791)
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
          :absolute 53572708
          :relative 1.3628437282810872
        )
        :calibrates (2353500 2293042)
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
          :absolute 53334375
          :relative 1.353137779085994
        )
        :calibrates (2415417 2315000)
      ))
    :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ((analysis-result
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
          :absolute 57035875
          :relative 1.3828222508807921
        )
        :calibrates (2412625 2311875)
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
          :absolute 57321542
          :relative 1.3835467051720902
        )
        :calibrates (2406708 2333541)
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
          :absolute 56919333
          :relative 1.3861560592355424
        )
        :calibrates (2362792 2316000)
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
          :absolute 53122875
          :relative 1.3515574976953104
        )
        :calibrates (2413042 2315792)
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
          :absolute 53883500
          :relative 1.3575060410842794
        )
        :calibrates (2401334 2329958)
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
          :absolute 53071500
          :relative 1.3556996097709328
        )
        :calibrates (2378000 2301417)
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
          :absolute 53824750
          :relative 1.3588374281644937
        )
        :calibrates (2396375 2315292)
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
          :absolute 54778958
          :relative 1.3650811296794425
        )
        :calibrates (2408625 2318125)
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
          :absolute 53947458
          :relative 1.3576809979037254
        )
        :calibrates (2387875 2347125)
      ))
    :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 59523667
          :relative 1.4011378386623576
        )
        :calibrates (2414209 2312750)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 59896000
          :relative 1.4040948521136327
        )
        :calibrates (2401792 2322459)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" yes
          )
        )
        :duration (duration
          :absolute 59100667
          :relative 1.398676514844304
        )
        :calibrates (2384167 2335875)
      ))
    :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 80528417
          :relative 1.539047810424556
        )
        :calibrates (2338042 2317083)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 80828458
          :relative 1.5401346606543662
        )
        :calibrates (2349416 2311375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 80482917
          :relative 1.5387868704020797
        )
        :calibrates (2347375 2307916)
      ))
    :"jpamb.cases.Arrays.binarySearch:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 62130083
          :relative 1.420221214426935
        )
        :calibrates (2394625 2327209)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 62599042
          :relative 1.4257001083083944
        )
        :calibrates (2389250 2308583)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 62093000
          :relative 1.4203683710272732
        )
        :calibrates (2361584 2355833)
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
          :absolute 53932083
          :relative 1.3646659580720517
        )
        :calibrates (2350334 2307792)
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
          :absolute 53956583
          :relative 1.3577505986670966
        )
        :calibrates (2374292 2360750)
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
          :absolute 53516375
          :relative 1.3564112313057384
        )
        :calibrates (2404583 2306334)
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
          :absolute 50526791
          :relative 1.3334367485673524
        )
        :calibrates (2388250 2301125)
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
          :absolute 51103625
          :relative 1.3306637006822088
        )
        :calibrates (2385417 2387875)
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
          :absolute 50396834
          :relative 1.3313778071259497
        )
        :calibrates (2396708 2302833)
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
          :absolute 52975000
          :relative 1.352868307936393
        )
        :calibrates (2399417 2302042)
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
          :absolute 53775000
          :relative 1.348604735542567
        )
        :calibrates (2379708 2439833)
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
          :absolute 55125667
          :relative 1.370155079604793
        )
        :calibrates (2366792 2334625)
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
          :absolute 50804417
          :relative 1.333833666825717
        )
        :calibrates (2412250 2298584)
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
          :absolute 51162542
          :relative 1.3306791590009621
        )
        :calibrates (2391458 2387167)
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
          :absolute 51603709
          :relative 1.3451502886933309
        )
        :calibrates (2349000 2312875)
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
          :absolute 50778417
          :relative 1.3322919911874906
        )
        :calibrates (2393042 2332125)
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
          :absolute 50676625
          :relative 1.3317998152875221
        )
        :calibrates (2413375 2307667)
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
          :absolute 50813542
          :relative 1.3351235385173998
        )
        :calibrates (2390041 2307666)
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
          :absolute 51382416
          :relative 1.3445200031027975
        )
        :calibrates (2345542 2303083)
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
          :absolute 50297750
          :relative 1.3353669113121414
        )
        :calibrates (2352417 2295000)
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
          :absolute 50842959
          :relative 1.3370497612634704
        )
        :calibrates (2367792 2311833)
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
          :absolute 61284083
          :relative 1.4197898617523173
        )
        :calibrates (2356042 2306125)
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
          :absolute 61427458
          :relative 1.411010661271842
        )
        :calibrates (2404667 2363834)
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
          :absolute 61451291
          :relative 1.4155193711572958
        )
        :calibrates (2346125 2374958)
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
          :absolute 52200250
          :relative 1.3481861181988424
        )
        :calibrates (2349917 2333000)
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
          :absolute 53074125
          :relative 1.3530725101298398
        )
        :calibrates (2383292 2324750)
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
          :absolute 52833791
          :relative 1.35101695262722
        )
        :calibrates (2399125 2309833)
      ))
    :"jpamb.cases.Dependent.normalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" yes
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 57372042
          :relative 1.3863791444991564
        )
        :calibrates (2376875 2336708)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" yes
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 56929042
          :relative 1.3846395747744664
        )
        :calibrates (2350084 2345875)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" yes
            :"null pointer" maybe
            :ok yes
            :"out of bounds" maybe
          )
        )
        :duration (duration
          :absolute 56869166
          :relative 1.3747147498965764
        )
        :calibrates (2407916 2391541)
      ))
    :"jpamb.cases.Dependent.safeDivByN:(I)I" ((analysis-result
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
          :absolute 53891333
          :relative 1.3620827293098885
        )
        :calibrates (2382917 2299458)
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
          :absolute 53333625
          :relative 1.3505571917930543
        )
        :calibrates (2380917 2377625)
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
          :absolute 53546583
          :relative 1.3581994285791468
        )
        :calibrates (2389250 2304958)
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
          :absolute 50707750
          :relative 1.3287521956143546
        )
        :calibrates (2393042 2364166)
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
          :absolute 51098750
          :relative 1.3358626999472138
        )
        :calibrates (2391750 2324291)
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
          :absolute 51243375
          :relative 1.338123600990864
        )
        :calibrates (2395791 2309041)
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
          :absolute 50601666
          :relative 1.3344968036681883
        )
        :calibrates (2388250 2296625)
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
          :absolute 51249625
          :relative 1.3369436049742804
        )
        :calibrates (2398833 2319375)
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
          :absolute 51110250
          :relative 1.336060080343519
        )
        :calibrates (2398917 2316042)
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
          :absolute 50632667
          :relative 1.3358728252172645
        )
        :calibrates (2381166 2291750)
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
          :absolute 51113958
          :relative 1.3362951053373955
        )
        :calibrates (2415750 2297000)
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
          :absolute 50706209
          :relative 1.3282713782116597
        )
        :calibrates (2406875 2355458)
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
          :absolute 50006792
          :relative 1.3288204993299466
        )
        :calibrates (2388167 2302542)
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
          :absolute 50163083
          :relative 1.3261095500266995
        )
        :calibrates (2381833 2353000)
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
          :absolute 50071292
          :relative 1.3293148487281568
        )
        :calibrates (2387583 2303833)
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
          :absolute 53149166
          :relative 1.3540667996979405
        )
        :calibrates (2393792 2310125)
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
          :absolute 53395083
          :relative 1.3551417755413786
        )
        :calibrates (2387666 2326333)
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
          :absolute 53247542
          :relative 1.3590640699899987
        )
        :calibrates (2358458 2300250)
      ))
    :"jpamb.cases.Simple.assertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 60958500
          :relative 1.410484427253294
        )
        :calibrates (2382459 2355375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53138500
          :relative 1.3535067226566462
        )
        :calibrates (2401625 2307417)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 52811542
          :relative 1.3413015669978656
        )
        :calibrates (2411959 2401500)
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
          :absolute 55058667
          :relative 1.3678178242648251
        )
        :calibrates (2392750 2328292)
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
          :absolute 54067875
          :relative 1.3613749637243313
        )
        :calibrates (2391542 2313834)
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
          :absolute 52839500
          :relative 1.3525766395747953
        )
        :calibrates (2377459 2315125)
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
          :absolute 54566875
          :relative 1.3632509318267931
        )
        :calibrates (2393875 2334459)
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
          :absolute 53338375
          :relative 1.354469090310777
        )
        :calibrates (2396417 2319875)
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
          :absolute 53529000
          :relative 1.3611322893750337
        )
        :calibrates (2351166 2309917)
      ))
    :"jpamb.cases.Simple.assertTrue:()V" ((analysis-result
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
          :absolute 53833125
          :relative 1.3591432417291056
        )
        :calibrates (2394625 2314458)
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
          :absolute 53236375
          :relative 1.352515077886662
        )
        :calibrates (2407417 2321083)
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
          :absolute 53059667
          :relative 1.3568536904755495
        )
        :calibrates (2359500 2306458)
      ))
    :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ((analysis-result
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
          :absolute 51957042
          :relative 1.3433269403166244
        )
        :calibrates (2388584 2324959)
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
          :absolute 50834541
          :relative 1.3349562490919011
        )
        :calibrates (2360625 2340834)
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
          :absolute 51258667
          :relative 1.3296767807496883
        )
        :calibrates (2377750 2420916)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
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
          :absolute 96167250
          :relative 1.5010235732489883
        )
        :calibrates (2399125 3668708)
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
          :absolute 50541958
          :relative 1.3355356739865902
        )
        :calibrates (2363750 2304417)
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
          :absolute 50988834
          :relative 1.339273389152092
        )
        :calibrates (2381167 2287917)
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
          :absolute 95736209
          :relative 1.4374220133494804
        )
        :calibrates (3541458 3451875)
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
          :absolute 53399625
          :relative 1.358461569048204
        )
        :calibrates (2379625 2298875)
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
          :absolute 53444958
          :relative 1.3524984749313114
        )
        :calibrates (2372625 2374583)
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
          :absolute 62824875
          :relative 1.3333937861877163
        )
        :calibrates (3347875 2483458)
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
          :absolute 53367750
          :relative 1.356684855108423
        )
        :calibrates (2392375 2302500)
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
          :absolute 54201292
          :relative 1.3647009935063463
        )
        :calibrates (2350542 2330458)
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
          :absolute 57374292
          :relative 1.3614799792665053
        )
        :calibrates (2508084 2483833)
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
          :absolute 53416083
          :relative 1.3561077007005342
        )
        :calibrates (2392167 2313209)
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
          :absolute 53721291
          :relative 1.3646663182519767
        )
        :calibrates (2346708 2293208)
      ))
    :"jpamb.cases.Simple.divideByZero:()I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 54514667
          :relative 1.3499847029179446
        )
        :calibrates (2494666 2375667)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53463834
          :relative 1.3538846854664703
        )
        :calibrates (2400584 2333167)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" yes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 53113250
          :relative 1.3500424214060425
        )
        :calibrates (2334125 2410375)
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
          :absolute 57714500
          :relative 1.3729468400303417
        )
        :calibrates (2462000 2428667)
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
          :absolute 54916667
          :relative 1.366477970465509
        )
        :calibrates (2379375 2344041)
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
          :absolute 54733791
          :relative 1.3682902331467361
        )
        :calibrates (2389542 2298541)
      ))
    :"jpamb.cases.Simple.doNothing:()V" ((analysis-result
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
          :absolute 53441750
          :relative 1.345649687557601
        )
        :calibrates (2483958 2338417)
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
          :absolute 52394292
          :relative 1.3467479109803073
        )
        :calibrates (2391208 2324708)
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
          :absolute 53046459
          :relative 1.3525234197765839
        )
        :calibrates (2391666 2319875)
      ))
    :"jpamb.cases.Simple.earlyReturn:()I" ((analysis-result
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
          :absolute 53692250
          :relative 1.3495910782620113
        )
        :calibrates (2376417 2424791)
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
          :absolute 53062917
          :relative 1.352700268305688
        )
        :calibrates (2393125 2317959)
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
          :absolute 54492542
          :relative 1.3663871494093616
        )
        :calibrates (2384333 2303584)
      ))
    :"jpamb.cases.Simple.justAdd:(II)I" ((analysis-result
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
          :absolute 55051667
          :relative 1.3660564883137825
        )
        :calibrates (2391208 2348417)
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
          :absolute 55231458
          :relative 1.369953620735891
        )
        :calibrates (2395458 2317167)
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
          :absolute 54199792
          :relative 1.3526343128511091
        )
        :calibrates (2375833 2436917)
      ))
    :"jpamb.cases.Simple.justMulitply:(II)I" ((analysis-result
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
          :absolute 55338500
          :relative 1.3605901251243833
        )
        :calibrates (2433625 2391041)
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
          :absolute 55298625
          :relative 1.3662020684512912
        )
        :calibrates (2351500 2407791)
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
          :absolute 55515542
          :relative 1.3707785941267405
        )
        :calibrates (2422875 2305000)
      ))
    :"jpamb.cases.Simple.justReturn:()I" ((analysis-result
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
          :absolute 53353750
          :relative 1.354448515064042
        )
        :calibrates (2412875 2305000)
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
          :absolute 53097333
          :relative 1.3551845855821827
        )
        :calibrates (2372542 2314708)
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
          :absolute 53265292
          :relative 1.3452464434946163
        )
        :calibrates (2367584 2443333)
      ))
    :"jpamb.cases.Simple.justReturnNothing:()V" ((analysis-result
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
          :absolute 53521000
          :relative 1.354796380658465
        )
        :calibrates (2424292 2304583)
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
          :absolute 53020791
          :relative 1.3537134306821808
        )
        :calibrates (2387292 2309083)
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
          :absolute 53012666
          :relative 1.355074896623972
        )
        :calibrates (2377500 2303458)
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
          :absolute 53750417
          :relative 1.3617734894828684
        )
        :calibrates (2360417 2313041)
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
          :absolute 53241916
          :relative 1.354727920625249
        )
        :calibrates (2387541 2317417)
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
          :absolute 53473167
          :relative 1.3455261231312052
        )
        :calibrates (2377792 2448791)
      ))
    :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 58975375
          :relative 1.396992651933504
        )
        :calibrates (2393625 2334708)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 59599375
          :relative 1.4014182730776847
        )
        :calibrates (2410416 2319500)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" yes
            :"divide by zero" no
            :"null pointer" maybe
            :ok maybe
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 59151333
          :relative 1.400604224143296
        )
        :calibrates (2401583 2301583)
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
          :absolute 51821500
          :relative 1.343064999438543
        )
        :calibrates (2407416 2296667)
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
          :absolute 51678166
          :relative 1.3297722242979115
        )
        :calibrates (2405375 2431500)
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
          :absolute 51883042
          :relative 1.3437535912923086
        )
        :calibrates (2371750 2330458)
      ))
  )
)