(analysis-summary
  :config (analysis-config
    :cmd (/Users/gtserve/Code/pa-code/.venv/bin/python3 /Users/gtserve/Code/pa-code/experiment.py _analyze heuristic /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25T16-22-02Z-_0iwblkh/heuristic-selections.json /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25T16-22-02Z-_0iwblkh/heuristic-analysis-times.jsonl)
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
          :absolute 62781292
          :relative 1.414931816818595
        )
        :calibrates (2504375 2325417)
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
          :absolute 55631167
          :relative 1.381447758821224
        )
        :calibrates (2302875 2319875)
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
          :absolute 55639125
          :relative 1.3488358261842317
        )
        :calibrates (2493167 2490792)
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
          :absolute 54647583
          :relative 1.3607203725154096
        )
        :calibrates (2410250 2352750)
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
          :absolute 54922792
          :relative 1.3721170935580542
        )
        :calibrates (2360959 2302042)
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
          :absolute 56058916
          :relative 1.3697472799864734
        )
        :calibrates (2418167 2367334)
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
          :absolute 52827000
          :relative 1.359522118610016
        )
        :calibrates (2314625 2302417)
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
          :absolute 52629500
          :relative 1.3634372806046802
        )
        :calibrates (2245459 2313041)
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
          :absolute 54022334
          :relative 1.3635470210582215
        )
        :calibrates (2354458 2323500)
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
          :absolute 52708208
          :relative 1.3441698627165553
        )
        :calibrates (2403209 2369208)
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
          :absolute 52476209
          :relative 1.353450031072015
        )
        :calibrates (2353958 2297000)
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
          :absolute 53674750
          :relative 1.3584558912620524
        )
        :calibrates (2370458 2332208)
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
          :absolute 52577917
          :relative 1.3443822824836211
        )
        :calibrates (2368209 2390083)
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
          :absolute 52307750
          :relative 1.3529142889798693
        )
        :calibrates (2337000 2304750)
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
          :absolute 53279583
          :relative 1.3544546623162437
        )
        :calibrates (2389042 2322208)
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
          :absolute 52612917
          :relative 1.350309583271953
        )
        :calibrates (2389083 2307833)
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
          :absolute 52763708
          :relative 1.364154525923182
        )
        :calibrates (2254708 2307875)
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
          :absolute 53057500
          :relative 1.353590407337396
        )
        :calibrates (2380958 2320000)
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
          :absolute 55536917
          :relative 1.3655785474910556
        )
        :calibrates (2351667 2435000)
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
          :absolute 56672792
          :relative 1.3876176131395768
        )
        :calibrates (2335625 2307250)
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
          :absolute 56565917
          :relative 1.3946279851771153
        )
        :calibrates (2244583 2315333)
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
          :absolute 52965125
          :relative 1.3589038313053914
        )
        :calibrates (2320667 2315042)
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
          :absolute 52688542
          :relative 1.3523572526148544
        )
        :calibrates (2376583 2304959)
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
          :absolute 53027042
          :relative 1.3491882251052196
        )
        :calibrates (2403416 2342709)
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
          :absolute 53634084
          :relative 1.361735601455177
        )
        :calibrates (2357958 2305792)
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
          :absolute 53010958
          :relative 1.3567651604718696
        )
        :calibrates (2350458 2312167)
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
          :absolute 53881542
          :relative 1.3623363658386876
        )
        :calibrates (2355500 2323291)
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
          :absolute 58321250
          :relative 1.406236341110374
        )
        :calibrates (2252167 2325250)
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
          :absolute 58800583
          :relative 1.3968301879424594
        )
        :calibrates (2401125 2314958)
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
          :absolute 58151917
          :relative 1.388527180629389
        )
        :calibrates (2387542 2366542)
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
          :absolute 79025083
          :relative 1.5244926059969375
        )
        :calibrates (2406834 2317084)
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
          :absolute 79897250
          :relative 1.5328329509904686
        )
        :calibrates (2352458 2332750)
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
          :absolute 79957875
          :relative 1.5320475641456501
        )
        :calibrates (2387875 2309375)
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
          :absolute 61206000
          :relative 1.4114085129269187
        )
        :calibrates (2423792 2323167)
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
          :absolute 61839333
          :relative 1.4192509262533064
        )
        :calibrates (2391791 2318458)
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
          :absolute 61550375
          :relative 1.4304989526761038
        )
        :calibrates (2247750 2320625)
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
          :absolute 53611666
          :relative 1.3576103373591322
        )
        :calibrates (2401709 2304584)
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
          :absolute 54000209
          :relative 1.3606158266278285
        )
        :calibrates (2398292 2309417)
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
          :absolute 53774375
          :relative 1.35912660594994
        )
        :calibrates (2371333 2332791)
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
          :absolute 49754250
          :relative 1.3277496471352392
        )
        :calibrates (2372750 2305792)
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
          :absolute 50201417
          :relative 1.321788431521198
        )
        :calibrates (2389000 2396833)
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
          :absolute 50333083
          :relative 1.3316065229258711
        )
        :calibrates (2388666 2302459)
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
          :absolute 52741542
          :relative 1.3656608756369797
        )
        :calibrates (2237500 2307375)
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
          :absolute 52872125
          :relative 1.3497897861769599
        )
        :calibrates (2402875 2322834)
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
          :absolute 53094792
          :relative 1.352696210678724
        )
        :calibrates (2412583 2301375)
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
          :absolute 50951250
          :relative 1.3264650555024242
        )
        :calibrates (2439958 2365334)
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
          :absolute 50146666
          :relative 1.3429744096128333
        )
        :calibrates (2254125 2298875)
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
          :absolute 51033542
          :relative 1.3353733390697196
        )
        :calibrates (2392791 2322542)
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
          :absolute 50182458
          :relative 1.3215260281069865
        )
        :calibrates (2391917 2395000)
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
          :absolute 50214458
          :relative 1.3270091116124474
        )
        :calibrates (2400000 2329875)
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
          :absolute 52139375
          :relative 1.343242868546728
        )
        :calibrates (2393375 2337625)
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
          :absolute 50171625
          :relative 1.3288669724499842
        )
        :calibrates (2401667 2304000)
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
          :absolute 50931541
          :relative 1.3277228261971827
        )
        :calibrates (2340625 2448917)
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
          :absolute 50495958
          :relative 1.3289476426564943
        )
        :calibrates (2407666 2327541)
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
          :absolute 60016292
          :relative 1.4083308219243944
        )
        :calibrates (2380292 2307500)
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
          :absolute 60560958
          :relative 1.4130503813505353
        )
        :calibrates (2369958 2309250)
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
          :absolute 61244917
          :relative 1.4110370318591676
        )
        :calibrates (2437333 2316709)
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
          :absolute 52444917
          :relative 1.3466112782144957
        )
        :calibrates (2401958 2320000)
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
          :absolute 52318500
          :relative 1.3452567206515265
        )
        :calibrates (2419291 2306000)
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
          :absolute 51843167
          :relative 1.3443558336489194
        )
        :calibrates (2383875 2308208)
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
          :absolute 56870500
          :relative 1.378663690715201
        )
        :calibrates (2419459 2336667)
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
          :absolute 56315334
          :relative 1.3806999069484214
        )
        :calibrates (2391625 2296042)
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
          :absolute 56952959
          :relative 1.3837098343324297
        )
        :calibrates (2398250 2309750)
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
          :absolute 53636041
          :relative 1.3578578588387247
        )
        :calibrates (2395583 2310167)
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
          :absolute 52383625
          :relative 1.3523680922147776
        )
        :calibrates (2345333 2309000)
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
          :absolute 53780917
          :relative 1.3550217367666082
        )
        :calibrates (2387833 2361542)
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
          :absolute 50734750
          :relative 1.3370535149431182
        )
        :calibrates (2372958 2296667)
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
          :absolute 50365375
          :relative 1.3257909386983764
        )
        :calibrates (2345125 2412291)
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
          :absolute 50961625
          :relative 1.3460349130594529
        )
        :calibrates (2282334 2312167)
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
          :absolute 62761083
          :relative 1.4168087202453001
        )
        :calibrates (2388791 2418625)
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
          :absolute 51501459
          :relative 1.3346802727715725
        )
        :calibrates (2360667 2405500)
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
          :absolute 51228083
          :relative 1.3480754057546218
        )
        :calibrates (2250833 2346042)
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
          :absolute 50929458
          :relative 1.3369612392534087
        )
        :calibrates (2359667 2328875)
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
          :absolute 50607334
          :relative 1.330696166275389
        )
        :calibrates (2403833 2322750)
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
          :absolute 51124666
          :relative 1.3394843232118623
        )
        :calibrates (2362916 2316333)
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
          :absolute 53272375
          :relative 1.348831619688202
        )
        :calibrates (2414583 2357417)
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
          :absolute 49895375
          :relative 1.3271463995649084
        )
        :calibrates (2394625 2303709)
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
          :absolute 49715916
          :relative 1.3295124695848328
        )
        :calibrates (2353458 2302542)
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
          :absolute 53668583
          :relative 1.3552925828778186
        )
        :calibrates (2439292 2297208)
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
          :absolute 52908292
          :relative 1.3523673663416391
        )
        :calibrates (2374375 2326583)
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
          :absolute 52574292
          :relative 1.3489860697507396
        )
        :calibrates (2406584 2301209)
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
          :absolute 52900542
          :relative 1.3539659595655433
        )
        :calibrates (2347083 2335917)
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
          :absolute 52966875
          :relative 1.3407239269510116
        )
        :calibrates (2357417 2476625)
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
          :absolute 52826917
          :relative 1.3506531597220053
        )
        :calibrates (2410666 2301625)
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
          :absolute 54351834
          :relative 1.3546035037677042
        )
        :calibrates (2352833 2451584)
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
          :absolute 53394875
          :relative 1.355985264925881
        )
        :calibrates (2390584 2314250)
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
          :absolute 53451750
          :relative 1.3434255505651063
        )
        :calibrates (2398500 2449542)
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
          :absolute 57011458
          :relative 1.374828287103512
        )
        :calibrates (2482958 2327250)
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
          :absolute 53162791
          :relative 1.3539127619890146
        )
        :calibrates (2343625 2363167)
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
          :absolute 53495792
          :relative 1.3609364881145578
        )
        :calibrates (2354125 2306167)
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
          :absolute 53553500
          :relative 1.355971743142497
        )
        :calibrates (2368375 2350583)
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
          :absolute 52356500
          :relative 1.3580498916084462
        )
        :calibrates (2246584 2344875)
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
          :absolute 52911167
          :relative 1.362283975668179
        )
        :calibrates (2257208 2337875)
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
          :absolute 50691125
          :relative 1.3303438624579802
        )
        :calibrates (2436834 2301417)
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
          :absolute 49700833
          :relative 1.3306963861479693
        )
        :calibrates (2346458 2295458)
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
          :absolute 50767000
          :relative 1.3292593552964824
        )
        :calibrates (2408625 2348583)
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
          :absolute 50194917
          :relative 1.3224624971815073
        )
        :calibrates (2343250 2434542)
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
          :absolute 49716667
          :relative 1.3298378720629518
        )
        :calibrates (2357208 2295375)
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
          :absolute 50921125
          :relative 1.3391461654108192
        )
        :calibrates (2355125 2309125)
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
          :absolute 53809459
          :relative 1.3541904398636206
        )
        :calibrates (2419250 2341750)
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
          :absolute 53453292
          :relative 1.3569142642877976
        )
        :calibrates (2393042 2306875)
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
          :absolute 53466000
          :relative 1.3659920901372333
        )
        :calibrates (2245500 2358291)
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
          :absolute 53428208
          :relative 1.3564217465261428
        )
        :calibrates (2392667 2310375)
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
          :absolute 52669792
          :relative 1.3645046129850966
        )
        :calibrates (2240250 2310542)
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
          :absolute 53781000
          :relative 1.3472174812407236
        )
        :calibrates (2481583 2353917)
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
          :absolute 52352417
          :relative 1.3448149046762141
        )
        :calibrates (2401250 2331917)
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
          :absolute 52690875
          :relative 1.3529797965467443
        )
        :calibrates (2362334 2312709)
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
          :absolute 52826209
          :relative 1.3561813909692972
        )
        :calibrates (2353625 2299000)
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
          :absolute 52780667
          :relative 1.3525713717412655
        )
        :calibrates (2390375 2297041)
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
          :absolute 53101000
          :relative 1.3423017517871487
        )
        :calibrates (2395458 2433250)
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
          :absolute 52684250
          :relative 1.3462000873032614
        )
        :calibrates (2391042 2356958)
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
          :absolute 53913625
          :relative 1.3646145510749814
        )
        :calibrates (2351333 2305750)
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
          :absolute 56094250
          :relative 1.3639715205865757
        )
        :calibrates (2382542 2470084)
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
          :absolute 54162708
          :relative 1.3679940758316558
        )
        :calibrates (2355250 2287083)
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
          :absolute 52173625
          :relative 1.3505885660895394
        )
        :calibrates (2336208 2318500)
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
          :absolute 54512209
          :relative 1.3571278836007858
        )
        :calibrates (2479875 2310791)
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
          :absolute 52800583
          :relative 1.350709312732377
        )
        :calibrates (2390417 2318916)
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
          :absolute 52236458
          :relative 1.3614260674612215
        )
        :calibrates (2241208 2304250)
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
          :absolute 54566250
          :relative 1.3566939572364736
        )
        :calibrates (2409125 2391084)
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
          :absolute 52940917
          :relative 1.3517391426137289
        )
        :calibrates (2408708 2301958)
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
          :absolute 53896875
          :relative 1.3645456318615712
        )
        :calibrates (2360709 2295666)
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
          :absolute 56085750
          :relative 1.3655721979006532
        )
        :calibrates (2486583 2347458)
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
          :absolute 54741417
          :relative 1.3693362270339637
        )
        :calibrates (2385791 2291666)
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
          :absolute 53698375
          :relative 1.3590896821207934
        )
        :calibrates (2392875 2305000)
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
          :absolute 55958833
          :relative 1.3639260640084585
        )
        :calibrates (2404459 2436959)
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
          :absolute 54491667
          :relative 1.3634910622851644
        )
        :calibrates (2371666 2347541)
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
          :absolute 51877875
          :relative 1.3446272362979457
        )
        :calibrates (2362750 2329541)
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
          :absolute 52786209
          :relative 1.3535328657179473
        )
        :calibrates (2365041 2312500)
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
          :absolute 52786292
          :relative 1.3637457724307824
        )
        :calibrates (2257459 2311375)
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
          :absolute 52106208
          :relative 1.3439928320093022
        )
        :calibrates (2404708 2315125)
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
          :absolute 54034000
          :relative 1.3617495295824291
        )
        :calibrates (2387833 2310541)
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
          :absolute 52158375
          :relative 1.3484254014967472
        )
        :calibrates (2364125 2312458)
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
          :absolute 52508167
          :relative 1.3505859154424285
        )
        :calibrates (2366416 2318167)
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
          :absolute 55127500
          :relative 1.3631673278406675
        )
        :calibrates (2404417 2373416)
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
          :absolute 53129792
          :relative 1.3548674028512067
        )
        :calibrates (2389417 2304125)
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
          :absolute 57798209
          :relative 1.3891595622804362
        )
        :calibrates (2407500 2310792)
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
          :absolute 59484625
          :relative 1.3987411141118087
        )
        :calibrates (2407750 2342250)
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
          :absolute 58874417
          :relative 1.3966237435084217
        )
        :calibrates (2408625 2315625)
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
          :absolute 51142875
          :relative 1.3396621815583358
        )
        :calibrates (2362416 2316583)
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
          :absolute 51772375
          :relative 1.3445922411999216
        )
        :calibrates (2360042 2323084)
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
          :absolute 50984083
          :relative 1.329650426920751
        )
        :calibrates (2396667 2376583)
      ))
  )
)