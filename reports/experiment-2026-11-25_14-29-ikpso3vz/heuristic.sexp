(analysis-summary
  :config (analysis-config
    :cmd (/Users/gtserve/Code/pa-code/.venv/bin/python /Users/gtserve/Code/pa-code/experiment.py _analyze heuristic /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25_14-29-ikpso3vz/heuristic-selections.json /Users/gtserve/Code/pa-code/reports/experiment-2026-11-25_14-29-ikpso3vz/heuristic-analysis-times.jsonl)
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
          :absolute 55144292
          :relative 1.3635155310201796
        )
        :calibrates (2451875 2323583)
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
          :absolute 55432875
          :relative 1.3607677334849542
        )
        :calibrates (2380084 2450834)
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
          :absolute 56585208
          :relative 1.3789713126148941
        )
        :calibrates (2423250 2305666)
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
          :absolute 54641917
          :relative 1.3687704060651142
        )
        :calibrates (2357417 2317625)
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
          :absolute 55483292
          :relative 1.3648415623771935
        )
        :calibrates (2395125 2395042)
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
          :absolute 55901958
          :relative 1.37560137431513
        )
        :calibrates (2375166 2333042)
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
          :absolute 53298166
          :relative 1.3504053662574924
        )
        :calibrates (2365250 2391791)
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
          :absolute 53469209
          :relative 1.3409550868227746
        )
        :calibrates (2394208 2483083)
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
          :absolute 54172292
          :relative 1.3529782597534452
        )
        :calibrates (2377500 2429000)
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
          :absolute 52692083
          :relative 1.3487835888863193
        )
        :calibrates (2406000 2314541)
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
          :absolute 53394458
          :relative 1.360155732230038
        )
        :calibrates (2349500 2310334)
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
          :absolute 53466834
          :relative 1.357945510597918
        )
        :calibrates (2390125 2299833)
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
          :absolute 53255792
          :relative 1.3553567412265988
        )
        :calibrates (2385417 2313958)
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
          :absolute 53431208
          :relative 1.3524020059906854
        )
        :calibrates (2442666 2304375)
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
          :absolute 53694500
          :relative 1.3565885939265874
        )
        :calibrates (2377250 2347417)
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
          :absolute 52994833
          :relative 1.357557632807708
        )
        :calibrates (2346125 2306584)
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
          :absolute 54138042
          :relative 1.3497470329053174
        )
        :calibrates (2450208 2389125)
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
          :absolute 53878042
          :relative 1.3597437371361913
        )
        :calibrates (2395958 2310542)
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
          :absolute 57225500
          :relative 1.3805528586693194
        )
        :calibrates (2384542 2380500)
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
          :absolute 57040375
          :relative 1.382504221050173
        )
        :calibrates (2408417 2319917)
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
          :absolute 57702833
          :relative 1.3888221682271933
        )
        :calibrates (2397500 2316667)
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
          :absolute 53646041
          :relative 1.355014691347943
        )
        :calibrates (2343083 2394458)
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
          :absolute 53179000
          :relative 1.3518822116037952
        )
        :calibrates (2422125 2308167)
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
          :absolute 54439292
          :relative 1.353707782706384
        )
        :calibrates (2413458 2408625)
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
          :absolute 54184458
          :relative 1.3594434282424865
        )
        :calibrates (2415166 2321375)
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
          :absolute 54411834
          :relative 1.3673794183482588
        )
        :calibrates (2337541 2332750)
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
          :absolute 55283750
          :relative 1.355923954344278
        )
        :calibrates (2372625 2499333)
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
          :absolute 59042459
          :relative 1.400882711688001
        )
        :calibrates (2371958 2319542)
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
          :absolute 59152333
          :relative 1.3987187383446569
        )
        :calibrates (2400292 2323417)
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
          :absolute 59796625
          :relative 1.407623241930443
        )
        :calibrates (2364458 2313792)
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
          :absolute 80058584
          :relative 1.5370511705064644
        )
        :calibrates (2334750 2314541)
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
          :absolute 81055750
          :relative 1.5375735965377215
        )
        :calibrates (2377666 2323875)
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
          :absolute 81223750
          :relative 1.5382956694822756
        )
        :calibrates (2392792 2310667)
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
          :absolute 61411000
          :relative 1.416804974356727
        )
        :calibrates (2388500 2315542)
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
          :absolute 65311792
          :relative 1.4118210433596663
        )
        :calibrates (2356750 2703833)
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
          :absolute 62874417
          :relative 1.4252668953720515
        )
        :calibrates (2357292 2365916)
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
          :absolute 54058541
          :relative 1.3611155193457807
        )
        :calibrates (2369292 2338083)
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
          :absolute 61347459
          :relative 1.3955174175232412
        )
        :calibrates (2614042 2321208)
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
          :absolute 54914125
          :relative 1.3680660167798848
        )
        :calibrates (2391916 2314042)
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
          :absolute 50672875
          :relative 1.3344127361426406
        )
        :calibrates (2376917 2315459)
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
          :absolute 53170625
          :relative 1.3490112419743516
        )
        :calibrates (2459875 2301041)
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
          :absolute 51599333
          :relative 1.3384917937053098
        )
        :calibrates (2380166 2353333)
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
          :absolute 53508916
          :relative 1.363656377111796
        )
        :calibrates (2305708 2326625)
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
          :absolute 54076209
          :relative 1.3643048786446648
        )
        :calibrates (2380000 2294459)
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
          :absolute 54355833
          :relative 1.3615450429519573
        )
        :calibrates (2344792 2383792)
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
          :absolute 51457250
          :relative 1.3389334389014962
        )
        :calibrates (2393292 2322375)
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
          :absolute 51634292
          :relative 1.3358635758165098
        )
        :calibrates (2385166 2380292)
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
          :absolute 51113875
          :relative 1.3364172575664974
        )
        :calibrates (2389209 2322208)
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
          :absolute 50390333
          :relative 1.3281948425720023
        )
        :calibrates (2420292 2313208)
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
          :absolute 51561583
          :relative 1.3409659302884598
        )
        :calibrates (2381708 2321458)
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
          :absolute 51341417
          :relative 1.342797506341191
        )
        :calibrates (2336333 2327042)
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
          :absolute 50174958
          :relative 1.3351122073984958
        )
        :calibrates (2331916 2306875)
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
          :absolute 132385000
          :relative 1.6345765702161539
        )
        :calibrates (2407209 3734542)
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
          :absolute 50763333
          :relative 1.328521138943112
        )
        :calibrates (2398041 2366916)
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
          :absolute 60318167
          :relative 1.4094149256165975
        )
        :calibrates (2397542 2302083)
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
          :absolute 90912625
          :relative 1.3880156516297157
        )
        :calibrates (3964166 3476958)
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
          :absolute 61991708
          :relative 1.4152437325303182
        )
        :calibrates (2410958 2354667)
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
          :absolute 51858125
          :relative 1.3479970051490584
        )
        :calibrates (2345167 2309084)
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
          :absolute 73195166
          :relative 1.3910166708027962
        )
        :calibrates (3461417 2488292)
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
          :absolute 54012667
          :relative 1.3610083600117553
        )
        :calibrates (2364500 2340041)
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
          :absolute 56785333
          :relative 1.3803437942078012
        )
        :calibrates (2409542 2321125)
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
          :absolute 78252625
          :relative 1.4806884688455795
        )
        :calibrates (2506458 2667709)
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
          :absolute 57820542
          :relative 1.3872460460862186
        )
        :calibrates (2424416 2316542)
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
          :absolute 53316792
          :relative 1.3433066957912116
        )
        :calibrates (2402500 2434625)
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
          :absolute 63316584
          :relative 1.317867785033784
        )
        :calibrates (2649542 3441333)
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
          :absolute 53828583
          :relative 1.3464057164134458
        )
        :calibrates (2343750 2505083)
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
          :absolute 50867000
          :relative 1.3359539384358097
        )
        :calibrates (2390666 2303000)
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
          :absolute 71905750
          :relative 1.379229403336764
        )
        :calibrates (3409208 2596500)
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
          :absolute 51667125
          :relative 1.340896910495671
        )
        :calibrates (2402667 2310875)
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
          :absolute 50956667
          :relative 1.324201523325625
        )
        :calibrates (2378500 2452416)
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
          :absolute 59684375
          :relative 1.365371580556003
        )
        :calibrates (2632875 2513709)
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
          :absolute 51444208
          :relative 1.342968236135498
        )
        :calibrates (2347208 2323667)
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
          :absolute 50934208
          :relative 1.3331248864022724
        )
        :calibrates (2405625 2324958)
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
          :absolute 58871875
          :relative 1.3594364347782384
        )
        :calibrates (2471667 2674708)
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
          :absolute 51804416
          :relative 1.3391299922292261
        )
        :calibrates (2385542 2359792)
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
          :absolute 49563583
          :relative 1.3241950086337622
        )
        :calibrates (2389458 2309458)
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
          :absolute 57975500
          :relative 1.312373428332992
        )
        :calibrates (2663708 2984375)
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
          :absolute 50762292
          :relative 1.3347967994866445
        )
        :calibrates (2380834 2315667)
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
          :absolute 53608000
          :relative 1.3580000673611805
        )
        :calibrates (2363792 2337958)
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
          :absolute 62245958
          :relative 1.386125734053381
        )
        :calibrates (2572750 2544250)
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
          :absolute 53971333
          :relative 1.3577929092186918
        )
        :calibrates (2379042 2356833)
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
          :absolute 52850541
          :relative 1.3498461314755628
        )
        :calibrates (2415625 2307542)
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
          :absolute 56794125
          :relative 1.3489178604615342
        )
        :calibrates (2500917 2585542)
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
          :absolute 53756375
          :relative 1.3542599489129017
        )
        :calibrates (2387667 2367875)
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
          :absolute 53223125
          :relative 1.3552519286620475
        )
        :calibrates (2383667 2313959)
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
          :absolute 55269959
          :relative 1.3430570319938835
        )
        :calibrates (2478625 2538583)
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
          :absolute 54322250
          :relative 1.3679443143737755
        )
        :calibrates (2340416 2316125)
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
          :absolute 54339875
          :relative 1.3636158645123608
        )
        :calibrates (2400375 2304334)
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
          :absolute 56634250
          :relative 1.3740458124851689
        )
        :calibrates (2394708 2392291)
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
          :absolute 54606084
          :relative 1.3674610519244412
        )
        :calibrates (2383208 2302875)
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
          :absolute 53244833
          :relative 1.3598972897810901
        )
        :calibrates (2338667 2310875)
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
          :absolute 55778208
          :relative 1.3679871642845756
        )
        :calibrates (2358333 2422542)
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
          :absolute 53487833
          :relative 1.3533958988286678
        )
        :calibrates (2384875 2356334)
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
          :absolute 50825666
          :relative 1.3317357692458738
        )
        :calibrates (2402250 2333375)
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
          :absolute 52841834
          :relative 1.3501003851436104
        )
        :calibrates (2362500 2357125)
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
          :absolute 51740417
          :relative 1.3441580190945732
        )
        :calibrates (2381875 2303042)
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
          :absolute 50157709
          :relative 1.3276634193707932
        )
        :calibrates (2397084 2320333)
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
          :absolute 53025375
          :relative 1.3496858371758464
        )
        :calibrates (2403083 2337458)
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
          :absolute 50805667
          :relative 1.3349290369749314
        )
        :calibrates (2384125 2314958)
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
          :absolute 53643875
          :relative 1.3567768288005015
        )
        :calibrates (2373584 2344583)
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
          :absolute 56761834
          :relative 1.3803745024703855
        )
        :calibrates (2405833 2322542)
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
          :absolute 53755917
          :relative 1.352975768561919
        )
        :calibrates (2367042 2402542)
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
          :absolute 53702125
          :relative 1.3498027590271433
        )
        :calibrates (2247167 2552584)
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
          :absolute 55601916
          :relative 1.3573848258232406
        )
        :calibrates (2466917 2416625)
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
          :absolute 53768375
          :relative 1.3422221153129088
        )
        :calibrates (2393875 2496417)
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
          :absolute 54346833
          :relative 1.363913945890937
        )
        :calibrates (2387791 2314292)
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
          :absolute 55411250
          :relative 1.3642509061355337
        )
        :calibrates (2460500 2329958)
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
          :absolute 54242042
          :relative 1.366293330659137
        )
        :calibrates (2333375 2334000)
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
          :absolute 53210834
          :relative 1.3582676089380783
        )
        :calibrates (2362792 2301250)
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
          :absolute 54500167
          :relative 1.361428089944091
        )
        :calibrates (2438000 2304417)
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
          :absolute 53268958
          :relative 1.3557606648255982
        )
        :calibrates (2385000 2311167)
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
          :absolute 54350708
          :relative 1.3666007603792865
        )
        :calibrates (2365666 2307750)
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
          :absolute 56487583
          :relative 1.374787217577243
        )
        :calibrates (2436167 2330291)
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
          :absolute 55280459
          :relative 1.3706076541615335
        )
        :calibrates (2385708 2324000)
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
          :absolute 52566083
          :relative 1.340777120087869
        )
        :calibrates (2394667 2402209)
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
          :absolute 55520625
          :relative 1.3666057481437455
        )
        :calibrates (2430083 2343875)
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
          :absolute 53729375
          :relative 1.3614060134793053
        )
        :calibrates (2345791 2329792)
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
          :absolute 52901500
          :relative 1.3323231975148537
        )
        :calibrates (2403584 2518792)
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
          :absolute 54099541
          :relative 1.3484818374730405
        )
        :calibrates (2397209 2452791)
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
          :absolute 53547334
          :relative 1.355006157310617
        )
        :calibrates (2414000 2314917)
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
          :absolute 55102458
          :relative 1.3581451422309065
        )
        :calibrates (2400667 2430542)
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
          :absolute 56801125
          :relative 1.3720583254348988
        )
        :calibrates (2462667 2360459)
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
          :absolute 55930916
          :relative 1.3781037066685866
        )
        :calibrates (2372666 2310917)
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
          :absolute 55532542
          :relative 1.3686745231926027
        )
        :calibrates (2433166 2319125)
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
          :absolute 56005584
          :relative 1.3903956393881451
        )
        :calibrates (2244417 2314542)
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
          :absolute 55551166
          :relative 1.3570919526106697
        )
        :calibrates (2383209 2499167)
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
          :absolute 53912250
          :relative 1.3456495165293392
        )
        :calibrates (2407625 2457208)
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
          :absolute 53790958
          :relative 1.3721478239780247
        )
        :calibrates (2230167 2336417)
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
          :absolute 53904500
          :relative 1.354592203857421
        )
        :calibrates (2409041 2355958)
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
          :absolute 52658125
          :relative 1.3421183498954452
        )
        :calibrates (2407375 2383083)
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
          :absolute 53704375
          :relative 1.3559298605557708
        )
        :calibrates (2393834 2338875)
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
          :absolute 53484000
          :relative 1.3575527930802778
        )
        :calibrates (2390750 2304958)
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
          :absolute 54002875
          :relative 1.3559159324961174
        )
        :calibrates (2391000 2368167)
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
          :absolute 55010292
          :relative 1.3707565640333514
        )
        :calibrates (2342334 2342750)
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
          :absolute 57673959
          :relative 1.3928595614864532
        )
        :calibrates (2353083 2315125)
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
          :absolute 59060250
          :relative 1.3983488670626967
        )
        :calibrates (2376708 2343666)
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
          :absolute 59718209
          :relative 1.3946683053502007
        )
        :calibrates (2405500 2408083)
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
          :absolute 59804750
          :relative 1.4083945806727631
        )
        :calibrates (2360458 2310125)
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
          :absolute 51253000
          :relative 1.335876669050693
        )
        :calibrates (2326875 2403250)
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
          :absolute 52914041
          :relative 1.3342941584609165
        )
        :calibrates (2407333 2493916)
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
          :absolute 52399542
          :relative 1.3483520416754815
        )
        :calibrates (2386875 2312125)
      ))
  )
)