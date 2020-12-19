As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on December 18, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.






![Alabama](https://user-images.githubusercontent.com/67207788/102683535-ee62f400-419f-11eb-8c66-11c1396bb1dd.png)
![Alaska](https://user-images.githubusercontent.com/67207788/102683536-f1f67b00-419f-11eb-894c-910a47635952.png)
![Arizona](https://user-images.githubusercontent.com/67207788/102683537-f458d500-419f-11eb-9861-07c2f669e7d9.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/102683539-f6bb2f00-419f-11eb-8519-417bb6b5c341.png)
![California](https://user-images.githubusercontent.com/67207788/102683545-f7ec5c00-419f-11eb-8c79-43e3ebc61684.png)
![Colorado](https://user-images.githubusercontent.com/67207788/102683546-f91d8900-419f-11eb-8514-db3a047e30c1.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/102683548-fae74c80-419f-11eb-9a2e-2839fab978ad.png)
![Delaware](https://user-images.githubusercontent.com/67207788/102683549-fc187980-419f-11eb-922b-94e954a3280e.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/102683550-fcb11000-419f-11eb-9cd0-022345f50fc2.png)
![Florida](https://user-images.githubusercontent.com/67207788/102683551-fde23d00-419f-11eb-8b73-e35ec4315c79.png)
![Georgia](https://user-images.githubusercontent.com/67207788/102683553-ffac0080-419f-11eb-8728-e1374da7be5e.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/102683554-0175c400-41a0-11eb-8af1-208d84da2f69.png)
![Idaho](https://user-images.githubusercontent.com/67207788/102683556-03d81e00-41a0-11eb-9ffa-c2b012582582.png)
![Illinois](https://user-images.githubusercontent.com/67207788/102683560-05094b00-41a0-11eb-8b78-2d211fc844c4.png)
![Indiana](https://user-images.githubusercontent.com/67207788/102683561-063a7800-41a0-11eb-8f51-d2eaba407d0e.png)
![Iowa](https://user-images.githubusercontent.com/67207788/102683563-06d30e80-41a0-11eb-8588-e53760a62e47.png)
![Kansas](https://user-images.githubusercontent.com/67207788/102683565-09356880-41a0-11eb-8efe-970eeeadfe81.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/102683566-0aff2c00-41a0-11eb-9fc1-1f841d4e5671.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/102683568-0c305900-41a0-11eb-846c-9725e85e7cda.png)
![Maine](https://user-images.githubusercontent.com/67207788/102683569-0f2b4980-41a0-11eb-9a9e-2a2a94c6905e.png)
![Maryland](https://user-images.githubusercontent.com/67207788/102683570-118da380-41a0-11eb-9a75-d1ce6b83190e.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/102683571-13576700-41a0-11eb-8902-f917acd61728.png)
![Michigan](https://user-images.githubusercontent.com/67207788/102683572-15b9c100-41a0-11eb-9178-77a13f0abec8.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/102683574-17838480-41a0-11eb-929d-38ff522e0be6.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/102683576-1a7e7500-41a0-11eb-9570-20344a1d6c9c.png)
![Missouri](https://user-images.githubusercontent.com/67207788/102683577-1ce0cf00-41a0-11eb-814f-c24a8c311523.png)
![Montana](https://user-images.githubusercontent.com/67207788/102683579-1fdbbf80-41a0-11eb-8aec-99b8f83cb58c.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/102683580-21a58300-41a0-11eb-9259-966468b40859.png)
![Nevada](https://user-images.githubusercontent.com/67207788/102683581-2407dd00-41a0-11eb-8f73-1004c5e5ea6e.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/102683582-266a3700-41a0-11eb-9aa3-c3643ca8d991.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/102683583-2833fa80-41a0-11eb-9c02-c9b8c46cc573.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/102683584-2a965480-41a0-11eb-9cc4-eea93aeca6b1.png)
![New York](https://user-images.githubusercontent.com/67207788/102683585-2bc78180-41a0-11eb-980d-b07aaa291394.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/102683586-2d914500-41a0-11eb-8b5a-8fd0bbf23a0e.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/102683587-2f5b0880-41a0-11eb-88af-35717169de64.png)
![Ohio](https://user-images.githubusercontent.com/67207788/102683591-31bd6280-41a0-11eb-909a-cf5be8b2b6bb.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/102683593-33872600-41a0-11eb-9077-d26c257e4339.png)
![Oregon](https://user-images.githubusercontent.com/67207788/102683596-35e98000-41a0-11eb-9882-6251f3a7563a.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/102683598-371aad00-41a0-11eb-8197-ff094eb1b127.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/102683600-38e47080-41a0-11eb-82b9-1e7819c093a3.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/102683602-3a159d80-41a0-11eb-8df8-6c04e005c6ad.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/102683604-3bdf6100-41a0-11eb-890d-8aa99a6ae05a.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/102683605-3d108e00-41a0-11eb-9519-993c8cab72bb.png)
![Texas](https://user-images.githubusercontent.com/67207788/102683607-3e41bb00-41a0-11eb-8a17-857e32250c03.png)
![Utah](https://user-images.githubusercontent.com/67207788/102683608-413cab80-41a0-11eb-8bd4-3ec2ba09d27b.png)
![Vermont](https://user-images.githubusercontent.com/67207788/102683610-43066f00-41a0-11eb-90dd-f67b953a6a8d.png)
![Virginia](https://user-images.githubusercontent.com/67207788/102683612-4568c900-41a0-11eb-9501-86bcef76cbf7.png)
![Washington](https://user-images.githubusercontent.com/67207788/102683613-47328c80-41a0-11eb-9858-5844f3de3c64.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/102683615-4863b980-41a0-11eb-8b3b-03332fb92de5.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/102683617-4a2d7d00-41a0-11eb-8b95-e23f89e7fcfb.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/102683618-4b5eaa00-41a0-11eb-9b2a-1d6f9d87a590.png)



