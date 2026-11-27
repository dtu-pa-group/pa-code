(analysis-summary
  :config (analysis-config
    :cmd (/Users/gtserve/Code/pa-code/.venv/bin/python /Users/gtserve/Code/pa-code/evaluation.py _analyze run-all /Users/gtserve/Code/pa-code/reports/evaluation-71tnhonc/run-all-selections.json /Users/gtserve/Code/pa-code/reports/evaluation-71tnhonc/run-all-analysis-times.jsonl)
    :analysis (analysis-info
      :name evaluation-run-all
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
          :absolute 359502125
          :relative 2.1693326257531305
        )
        :calibrates (2505333 2363208)
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
          :absolute 363917000
          :relative 2.184402577628498
        )
        :calibrates (2439459 2320791)
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
          :absolute 364129084
          :relative 2.193864500414123
        )
        :calibrates (2335625 2324750)
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
          :absolute 422362125
          :relative 2.259916278244677
        )
        :calibrates (2310500 2332500)
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
          :absolute 435596250
          :relative 2.2644198129984856
        )
        :calibrates (2382916 2356167)
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
          :absolute 431132667
          :relative 2.2630851753950663
        )
        :calibrates (2392208 2312750)
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
          :absolute 118344542
          :relative 1.691180029024602
        )
        :calibrates (2372833 2446625)
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
          :absolute 119954458
          :relative 1.686887558663588
        )
        :calibrates (2409917 2523625)
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
          :absolute 119971458
          :relative 1.7080755008563377
        )
        :calibrates (2381875 2317417)
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
          :absolute 76529084
          :relative 1.5151290580664214
        )
        :calibrates (2353292 2321125)
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
          :absolute 76710042
          :relative 1.5156943657212472
        )
        :calibrates (2358375 2321000)
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
          :absolute 77025125
          :relative 1.5194591005787206
        )
        :calibrates (2346000 2312041)
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
          :absolute 78248708
          :relative 1.5268052007233808
        )
        :calibrates (2343375 2309292)
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
          :absolute 79686750
          :relative 1.5213069003990713
        )
        :calibrates (2395125 2403416)
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
          :absolute 78757042
          :relative 1.5252676456167227
        )
        :calibrates (2391209 2308292)
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
          :absolute 128649250
          :relative 1.738308627293947
        )
        :calibrates (2369542 2330791)
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
          :absolute 131656500
          :relative 1.7464421643973138
        )
        :calibrates (2371458 2349500)
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
          :absolute 130135792
          :relative 1.7407646275048239
        )
        :calibrates (2393833 2334000)
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
          :absolute 92648458
          :relative 1.5974947596364784
        )
        :calibrates (2360125 2321250)
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
          :absolute 93910916
          :relative 1.5965955510339338
        )
        :calibrates (2372833 2382167)
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
          :absolute 93163542
          :relative 1.5971628831154907
        )
        :calibrates (2388875 2322125)
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
          :absolute 114833167
          :relative 1.6865460985362015
        )
        :calibrates (2411917 2314709)
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
          :absolute 114826334
          :relative 1.6872253831965183
        )
        :calibrates (2376708 2342250)
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
          :absolute 115287125
          :relative 1.6901127416374258
        )
        :calibrates (2389625 2316875)
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
          :absolute 115621834
          :relative 1.6888646231764908
        )
        :calibrates (2424958 2308791)
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
          :absolute 117177667
          :relative 1.6860776278079055
        )
        :calibrates (2398125 2430208)
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
          :absolute 117415041
          :relative 1.6985402909462766
        )
        :calibrates (2389667 2311584)
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
          :absolute 121282042
          :relative 1.7124207678820464
        )
        :calibrates (2384833 2318500)
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
          :absolute 122349875
          :relative 1.7137226229415712
        )
        :calibrates (2399708 2330834)
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
          :absolute 122748458
          :relative 1.7220797097818055
        )
        :calibrates (2347250 2308250)
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
          :absolute 330747042
          :relative 2.1503884201325745
        )
        :calibrates (2356166 2322667)
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
          :absolute 332219500
          :relative 2.1477776480610378
        )
        :calibrates (2406500 2321500)
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
          :absolute 333574709
          :relative 2.153216239875223
        )
        :calibrates (2370041 2318167)
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
          :absolute 464550167
          :relative 2.28279124480732
        )
        :calibrates (2341625 2503125)
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
          :absolute 457102292
          :relative 2.2860597872286705
        )
        :calibrates (2395875 2335459)
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
          :absolute 458566291
          :relative 2.2907810783651623
        )
        :calibrates (2394542 2300625)
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
          :absolute 76724875
          :relative 1.5140261804278474
        )
        :calibrates (2351000 2347292)
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
          :absolute 77209875
          :relative 1.5237554666755193
        )
        :calibrates (2239833 2383417)
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
          :absolute 75265375
          :relative 1.5061012924996169
        )
        :calibrates (2379334 2314459)
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
          :absolute 92349917
          :relative 1.5934110217772313
        )
        :calibrates (2395958 2314417)
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
          :absolute 95230625
          :relative 1.6052708272422902
        )
        :calibrates (2387667 2338791)
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
          :absolute 93566084
          :relative 1.5983407160524437
        )
        :calibrates (2404000 2314541)
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
          :absolute 388094750
          :relative 2.2141397648028507
        )
        :calibrates (2413625 2326917)
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
          :absolute 392920750
          :relative 2.20675568865496
        )
        :calibrates (2427042 2454750)
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
          :absolute 390824625
          :relative 2.217256480269992
        )
        :calibrates (2414542 2325208)
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
          :absolute 107518625
          :relative 1.6642482069901854
        )
        :calibrates (2340750 2317958)
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
          :absolute 109632833
          :relative 1.6737668399032117
        )
        :calibrates (2315333 2332000)
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
          :absolute 108664084
          :relative 1.6681014829206593
        )
        :calibrates (2343708 2323042)
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
          :absolute 99009250
          :relative 1.6210382114209376
        )
        :calibrates (2395125 2343666)
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
          :absolute 98914625
          :relative 1.6205427661124059
        )
        :calibrates (2421250 2318416)
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
          :absolute 98885583
          :relative 1.636155743199621
        )
        :calibrates (2243958 2327000)
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
          :absolute 70899083
          :relative 1.4640785194682004
        )
        :calibrates (2361083 2509625)
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
          :absolute 72143292
          :relative 1.4836767285911057
        )
        :calibrates (2435042 2302458)
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
          :absolute 71352542
          :relative 1.4803978098264816
        )
        :calibrates (2384667 2336416)
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
          :absolute 149721791
          :relative 1.8065798451322777
        )
        :calibrates (2346667 2327833)
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
          :absolute 149531875
          :relative 1.7914122101180725
        )
        :calibrates (2366375 2468125)
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
          :absolute 148330750
          :relative 1.8029249648596204
        )
        :calibrates (2342458 2327750)
      ))
    :"jpamb.cases.Dependent.divisionLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 270399084
          :relative 2.060706407503991
        )
        :calibrates (2389167 2313333)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 273787625
          :relative 2.0659495391257723
        )
        :calibrates (2369792 2334500)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" maybe
            :"divide by zero" no
            :"null pointer" no
            :ok yes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 268363625
          :relative 2.058368614960078
        )
        :calibrates (2387875 2304417)
      ))
    :"jpamb.cases.Dependent.normalizedDistance:(II)I" ((analysis-result
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
          :absolute 155483791
          :relative 1.821395712759212
        )
        :calibrates (2384000 2307583)
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
          :absolute 156784542
          :relative 1.82121591088311
        )
        :calibrates (2395791 2337000)
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
          :absolute 156590375
          :relative 1.8285601494644288
        )
        :calibrates (2342083 2305583)
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
          :absolute 81667042
          :relative 1.5423750128422884
        )
        :calibrates (2386416 2298500)
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
          :absolute 82542666
          :relative 1.5349432013005901
        )
        :calibrates (2375541 2441333)
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
          :absolute 82425750
          :relative 1.5533448768269285
        )
        :calibrates (2303167 2307333)
      ))
    :"jpamb.cases.Loops.forever:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 848757334
          :relative 2.5502797131772876
        )
        :calibrates (2399083 2382083)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 843259042
          :relative 2.5357289308053055
        )
        :calibrates (2412667 2499375)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 847597000
          :relative 2.554775407152725
        )
        :calibrates (2388792 2336667)
      ))
    :"jpamb.cases.Loops.neverAsserts:()V" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 761608167
          :relative 2.513615297000983
        )
        :calibrates (2336500 2331666)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 779698917
          :relative 2.523795099221076
        )
        :calibrates (2351042 2317291)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 761690917
          :relative 2.524129743837712
        )
        :calibrates (2233042 2323958)
      ))
    :"jpamb.cases.Loops.neverDivides:()I" ((analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 791409750
          :relative 2.5201132640576147
        )
        :calibrates (2459458 2319334)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 792816209
          :relative 2.5192404028200532
        )
        :calibrates (2383125 2413791)
      ) (analysis-result
        :response (response
          :predictions (
            :* maybe
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 789087875
          :relative 2.533963992939365
        )
        :calibrates (2310375 2304834)
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
          :absolute 121239750
          :relative 1.6894232555337552
        )
        :calibrates (2428125 2529250)
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
          :absolute 119091208
          :relative 1.6934536047053346
        )
        :calibrates (2384375 2440167)
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
          :absolute 117769625
          :relative 1.697803137849445
        )
        :calibrates (2382209 2341250)
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
          :absolute 90668250
          :relative 1.570150761468627
        )
        :calibrates (2385041 2494000)
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
          :absolute 89391291
          :relative 1.5757497396637214
        )
        :calibrates (2407458 2341250)
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
          :absolute 86755334
          :relative 1.5734833798071741
        )
        :calibrates (2337250 2295542)
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
          :absolute 87455125
          :relative 1.5676825181848195
        )
        :calibrates (2417292 2315667)
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
          :absolute 86914583
          :relative 1.5722457863254187
        )
        :calibrates (2344083 2310458)
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
          :absolute 86415417
          :relative 1.5692508730124468
        )
        :calibrates (2338083 2321750)
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
          :absolute 83424459
          :relative 1.5478143311951833
        )
        :calibrates (2373833 2352334)
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
          :absolute 82633875
          :relative 1.541917668107262
        )
        :calibrates (2383791 2361583)
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
          :absolute 81462917
          :relative 1.5374732624099552
        )
        :calibrates (2420125 2306125)
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
          :absolute 91731333
          :relative 1.577764951804452
        )
        :calibrates (2409291 2441167)
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
          :absolute 92081084
          :relative 1.594973961065652
        )
        :calibrates (2347166 2332625)
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
          :absolute 90493167
          :relative 1.582562777415581
        )
        :calibrates (2403000 2329417)
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
          :absolute 61909541
          :relative 1.4175974914993614
        )
        :calibrates (2351292 2382292)
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
          :absolute 60864750
          :relative 1.4091978812781423
        )
        :calibrates (2398916 2345666)
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
          :absolute 60333375
          :relative 1.4219090597159527
        )
        :calibrates (2247500 2320000)
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
          :absolute 112127042
          :relative 1.6713011073989152
        )
        :calibrates (2395250 2384875)
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
          :absolute 110756083
          :relative 1.6629329084188715
        )
        :calibrates (2417541 2396000)
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
          :absolute 110923917
          :relative 1.6740150906915703
        )
        :calibrates (2387542 2311833)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
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
          :absolute 86278625
          :relative 1.5489585908769132
        )
        :calibrates (2391541 2483459)
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
          :absolute 84163667
          :relative 1.541133627064928
        )
        :calibrates (2388667 2453291)
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
          :absolute 83990791
          :relative 1.553822680553206
        )
        :calibrates (2349667 2343208)
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
          :absolute 94247541
          :relative 1.603483346812624
        )
        :calibrates (2380958 2316000)
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
          :absolute 93899583
          :relative 1.601134031506528
        )
        :calibrates (2388709 2316291)
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
          :absolute 93205250
          :relative 1.6010063019812846
        )
        :calibrates (2360708 2310875)
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
          :absolute 75508333
          :relative 1.5049870140237074
        )
        :calibrates (2367417 2353625)
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
          :absolute 75009250
          :relative 1.4950996914975008
        )
        :calibrates (2354167 2443666)
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
          :absolute 74702041
          :relative 1.5053595600700749
        )
        :calibrates (2354042 2312583)
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
          :absolute 95030709
          :relative 1.6054199131522366
        )
        :calibrates (2376333 2338584)
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
          :absolute 84344417
          :relative 1.5561990736131919
        )
        :calibrates (2371042 2315875)
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
          :absolute 82704042
          :relative 1.5493676467066564
        )
        :calibrates (2347042 2321584)
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
          :absolute 66061458
          :relative 1.4510107802511552
        )
        :calibrates (2372667 2304333)
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
          :absolute 66120333
          :relative 1.4396715454057358
        )
        :calibrates (2370917 2434084)
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
          :absolute 65966875
          :relative 1.4468933687656886
        )
        :calibrates (2355958 2358834)
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
          :absolute 80235334
          :relative 1.5277734712243474
        )
        :calibrates (2410500 2349667)
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
          :absolute 92565042
          :relative 1.5882194910962892
        )
        :calibrates (2387167 2390958)
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
          :absolute 80672083
          :relative 1.5324675878050706
        )
        :calibrates (2404417 2330209)
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
          :absolute 60181750
          :relative 1.4115074465628494
        )
        :calibrates (2360000 2306458)
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
          :absolute 60624041
          :relative 1.401616307285926
        )
        :calibrates (2404209 2404833)
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
          :absolute 59513458
          :relative 1.403100876245559
        )
        :calibrates (2403084 2301750)
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
          :absolute 63236208
          :relative 1.430630129048293
        )
        :calibrates (2364333 2327750)
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
          :absolute 63727208
          :relative 1.4263777824383788
        )
        :calibrates (2414708 2360333)
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
          :absolute 62703375
          :relative 1.4204744344334432
        )
        :calibrates (2389084 2373542)
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
          :absolute 80153709
          :relative 1.5288813577950606
        )
        :calibrates (2381959 2361250)
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
          :absolute 81039917
          :relative 1.5326964818634157
        )
        :calibrates (2420875 2332833)
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
          :absolute 80714750
          :relative 1.5362123663097071
        )
        :calibrates (2384417 2312042)
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
          :absolute 81200458
          :relative 1.5373371112764274
        )
        :calibrates (2390250 2322250)
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
          :absolute 80105917
          :relative 1.529581027809388
        )
        :calibrates (2414375 2318375)
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
          :absolute 80560625
          :relative 1.530619337087684
        )
        :calibrates (2372958 2375291)
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
          :absolute 62828542
          :relative 1.4219983712566577
        )
        :calibrates (2369000 2386417)
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
          :absolute 63134959
          :relative 1.425067434285966
        )
        :calibrates (2412000 2332959)
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
          :absolute 71858959
          :relative 1.4675881740469496
        )
        :calibrates (2416000 2480917)
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
          :absolute 59451041
          :relative 1.4050982351331565
        )
        :calibrates (2363375 2314959)
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
          :absolute 60464458
          :relative 1.4131201996343175
        )
        :calibrates (2361959 2309042)
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
          :absolute 61229000
          :relative 1.3269963964093838
        )
        :calibrates (3427500 2340042)
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
          :absolute 92351375
          :relative 1.591612312685856
        )
        :calibrates (2355916 2374083)
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
          :absolute 91706375
          :relative 1.594523602648201
        )
        :calibrates (2347416 2318167)
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
          :absolute 92193084
          :relative 1.5921392556741574
        )
        :calibrates (2411333 2304833)
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
          :absolute 115751958
          :relative 1.6925375547882437
        )
        :calibrates (2397125 2302041)
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
          :absolute 113569792
          :relative 1.6819484633647612
        )
        :calibrates (2407916 2316459)
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
          :absolute 113824375
          :relative 1.6850326168661283
        )
        :calibrates (2390500 2310959)
      ))
    :"jpamb.cases.Tricky.collatz:(I)V" ((analysis-result
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
          :absolute 301404000
          :relative 2.1056048895600097
        )
        :calibrates (2364208 2362667)
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
          :absolute 294856584
          :relative 2.1011146598133856
        )
        :calibrates (2353542 2318709)
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
          :absolute 295119542
          :relative 2.0998513245930828
        )
        :calibrates (2351541 2338500)
      ))
  )
)