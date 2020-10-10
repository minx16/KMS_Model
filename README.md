As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on October 9, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.


![Alabama](https://user-images.githubusercontent.com/67207788/95658055-ffc7ba00-0ae5-11eb-9efa-be15e2e5897a.png)
![Alaska](https://user-images.githubusercontent.com/67207788/95658058-01917d80-0ae6-11eb-9117-57c9508b2f0f.png)
![Arizona](https://user-images.githubusercontent.com/67207788/95658059-022a1400-0ae6-11eb-809f-2281de667782.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/95658061-035b4100-0ae6-11eb-9023-04922417bfdf.png)
![California](https://user-images.githubusercontent.com/67207788/95658063-03f3d780-0ae6-11eb-8fe1-de3346375761.png)
![Colorado](https://user-images.githubusercontent.com/67207788/95658064-048c6e00-0ae6-11eb-926e-d5e9d408f6b8.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/95658065-05250480-0ae6-11eb-89ab-6e195c7e206b.png)
![Delaware](https://user-images.githubusercontent.com/67207788/95658066-05bd9b00-0ae6-11eb-910e-ffc6bfe37b19.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/95658067-06eec800-0ae6-11eb-9298-018dc2570d0e.png)
![Florida](https://user-images.githubusercontent.com/67207788/95658068-07875e80-0ae6-11eb-83fe-fefea705d02e.png)
![Georgia](https://user-images.githubusercontent.com/67207788/95658069-081ff500-0ae6-11eb-8f8d-069e9e336381.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/95658070-09512200-0ae6-11eb-92bb-efbace0fc495.png)
![Idaho](https://user-images.githubusercontent.com/67207788/95658071-09e9b880-0ae6-11eb-8bd5-721912fe741a.png)
![Illinois](https://user-images.githubusercontent.com/67207788/95658073-0a824f00-0ae6-11eb-9457-eaf8beb877ee.png)
![Indiana](https://user-images.githubusercontent.com/67207788/95658074-0bb37c00-0ae6-11eb-9ee8-901a18ea421a.png)
![Iowa](https://user-images.githubusercontent.com/67207788/95658075-0c4c1280-0ae6-11eb-9126-d9424c0bad25.png)
![Kansas](https://user-images.githubusercontent.com/67207788/95658076-0ce4a900-0ae6-11eb-99f7-e663e894dfdd.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/95658077-0d7d3f80-0ae6-11eb-8442-ed0de3c23308.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/95658078-0eae6c80-0ae6-11eb-85cf-8ac005f7041b.png)
![Maine](https://user-images.githubusercontent.com/67207788/95658079-0f470300-0ae6-11eb-8a38-ddb78b18644b.png)
![Maryland](https://user-images.githubusercontent.com/67207788/95658082-0fdf9980-0ae6-11eb-80dc-30c3455c5377.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/95658083-10783000-0ae6-11eb-8e4a-0690def4f41a.png)
![Michigan](https://user-images.githubusercontent.com/67207788/95658085-11a95d00-0ae6-11eb-9c50-120d6d256ad8.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/95658087-1241f380-0ae6-11eb-85ae-200926f1755e.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/95658088-140bb700-0ae6-11eb-82ca-56970e97eff2.png)
![Missouri](https://user-images.githubusercontent.com/67207788/95658089-14a44d80-0ae6-11eb-88ea-6592fb790691.png)
![Montana](https://user-images.githubusercontent.com/67207788/95658090-15d57a80-0ae6-11eb-9583-3e7bd298585d.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/95658091-166e1100-0ae6-11eb-85bc-4c52620f949b.png)
![Nevada](https://user-images.githubusercontent.com/67207788/95658093-1706a780-0ae6-11eb-85df-4fc90f3d4868.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/95658094-179f3e00-0ae6-11eb-837c-7d5d66d0b66a.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/95658095-1837d480-0ae6-11eb-9598-7d4e5229a925.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/95658096-19690180-0ae6-11eb-8e4e-33fb20002c1b.png)
![New York](https://user-images.githubusercontent.com/67207788/95658097-1a019800-0ae6-11eb-9106-5cc30d2af091.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/95658098-1a9a2e80-0ae6-11eb-8dd5-b1a9ffc58c3c.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/95658100-1b32c500-0ae6-11eb-827b-91d2aae9fc52.png)
![Ohio](https://user-images.githubusercontent.com/67207788/95658101-1bcb5b80-0ae6-11eb-8232-4628e824f2fb.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/95658102-1c63f200-0ae6-11eb-9c6f-da52d51c3cc1.png)
![Oregon](https://user-images.githubusercontent.com/67207788/95658103-1cfc8880-0ae6-11eb-8abc-c7868b4f841d.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/95658106-1ec64c00-0ae6-11eb-8600-c15486c3e80f.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/95658108-1f5ee280-0ae6-11eb-8761-b3ca73b91ed0.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/95658109-20900f80-0ae6-11eb-82db-9fbc129cda9a.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/95658110-20900f80-0ae6-11eb-9c2e-846771fe3d31.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/95658111-2128a600-0ae6-11eb-98ad-2432cfd3c534.png)
![Texas](https://user-images.githubusercontent.com/67207788/95658113-2259d300-0ae6-11eb-971f-763d14806172.png)
![Utah](https://user-images.githubusercontent.com/67207788/95658114-22f26980-0ae6-11eb-80ce-32301652199f.png)
![Vermont](https://user-images.githubusercontent.com/67207788/95658115-238b0000-0ae6-11eb-876c-8d30724838ab.png)
![Virginia](https://user-images.githubusercontent.com/67207788/95658116-24239680-0ae6-11eb-950f-e5a07dfb1573.png)
![Washington](https://user-images.githubusercontent.com/67207788/95658117-24bc2d00-0ae6-11eb-9e71-c91b74c3588d.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/95658118-2554c380-0ae6-11eb-9399-f85a7edb86cb.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/95658119-25ed5a00-0ae6-11eb-997b-974006bbbfe5.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/95658120-271e8700-0ae6-11eb-9aba-b38c0dea46b2.png)


