As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on October 17, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.


![Alabama](https://user-images.githubusercontent.com/67207788/96364254-eaffad80-1107-11eb-850f-52e82afcbe96.png)
![Alaska](https://user-images.githubusercontent.com/67207788/96364255-ecc97100-1107-11eb-8a1d-c4b199df493d.png)
![Arizona](https://user-images.githubusercontent.com/67207788/96364256-ed620780-1107-11eb-898c-0a363cf445a9.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/96364257-edfa9e00-1107-11eb-8a5f-d0e9e33ffd73.png)
![California](https://user-images.githubusercontent.com/67207788/96364258-ef2bcb00-1107-11eb-8d8c-d60a87bcc100.png)
![Colorado](https://user-images.githubusercontent.com/67207788/96364259-ef2bcb00-1107-11eb-8bdd-0fc9b14a39f8.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/96364260-f05cf800-1107-11eb-873e-a51b96333db7.png)
![Delaware](https://user-images.githubusercontent.com/67207788/96364262-f0f58e80-1107-11eb-96e8-38fbedc1f5df.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/96364263-f0f58e80-1107-11eb-88e2-3051fd3b0666.png)
![Florida](https://user-images.githubusercontent.com/67207788/96364264-f226bb80-1107-11eb-9eee-08cb4c2ff757.png)
![Georgia](https://user-images.githubusercontent.com/67207788/96364265-f2bf5200-1107-11eb-917d-ffda0f24d7de.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/96364266-f357e880-1107-11eb-812a-4769876097b0.png)
![Idaho](https://user-images.githubusercontent.com/67207788/96364267-f3f07f00-1107-11eb-8862-91d327b7d595.png)
![Illinois](https://user-images.githubusercontent.com/67207788/96364268-f4891580-1107-11eb-860f-a4c924380e32.png)
![Indiana](https://user-images.githubusercontent.com/67207788/96364270-f521ac00-1107-11eb-8731-6c74aff47946.png)
![Iowa](https://user-images.githubusercontent.com/67207788/96364272-f5ba4280-1107-11eb-99f4-605bd6a5530c.png)
![Kansas](https://user-images.githubusercontent.com/67207788/96364273-f652d900-1107-11eb-9c81-54cea9c59565.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/96364274-f6eb6f80-1107-11eb-9ea7-325d89fbbad2.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/96364277-f6eb6f80-1107-11eb-9753-37718dac4ad7.png)
![Maine](https://user-images.githubusercontent.com/67207788/96364278-f7840600-1107-11eb-9204-33a836e04357.png)
![Maryland](https://user-images.githubusercontent.com/67207788/96364279-f81c9c80-1107-11eb-901d-c22252e9e407.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/96364280-f94dc980-1107-11eb-814d-8152c34422b2.png)
![Michigan](https://user-images.githubusercontent.com/67207788/96364281-f9e66000-1107-11eb-8666-420f68ab641a.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/96364283-fa7ef680-1107-11eb-84a0-542c2857460e.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/96364284-fb178d00-1107-11eb-94ab-1f7b408507c3.png)
![Missouri](https://user-images.githubusercontent.com/67207788/96364285-fbb02380-1107-11eb-95fb-103a6de3fb9d.png)
![Montana](https://user-images.githubusercontent.com/67207788/96364286-fc48ba00-1107-11eb-8850-0d60c200e132.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/96364287-fc48ba00-1107-11eb-95b5-c713f7f825b3.png)
![Nevada](https://user-images.githubusercontent.com/67207788/96364288-fd79e700-1107-11eb-8256-f225b8f85537.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/96364289-fd79e700-1107-11eb-9b3d-0b008aa5f771.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/96364290-fe127d80-1107-11eb-9bd7-b25dd55ee84d.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/96364291-ff43aa80-1107-11eb-8d50-3b32cd403907.png)
![New York](https://user-images.githubusercontent.com/67207788/96364292-ffdc4100-1107-11eb-8ed2-933106329c27.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/96364293-0074d780-1108-11eb-83d7-673711a5520c.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/96364296-010d6e00-1108-11eb-8f9b-cdc1f9036e30.png)
![Ohio](https://user-images.githubusercontent.com/67207788/96364297-01a60480-1108-11eb-8147-ac08a3bd3532.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/96364299-023e9b00-1108-11eb-9c15-3696d0ff3a01.png)
![Oregon](https://user-images.githubusercontent.com/67207788/96364301-02d73180-1108-11eb-93bc-625acc49de5c.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/96364302-036fc800-1108-11eb-949b-4d2be38ea569.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/96364303-04085e80-1108-11eb-954e-d9573e6828d7.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/96364304-04a0f500-1108-11eb-8d54-6d1ce75eb331.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/96364305-05398b80-1108-11eb-8a23-2e09d3bf505b.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/96364306-05d22200-1108-11eb-8ea9-7bf206d2e67e.png)
![Texas](https://user-images.githubusercontent.com/67207788/96364307-066ab880-1108-11eb-8865-57c4b20c3102.png)
![Utah](https://user-images.githubusercontent.com/67207788/96364308-07034f00-1108-11eb-8ee8-f5d6e1aa1463.png)
![Vermont](https://user-images.githubusercontent.com/67207788/96364309-079be580-1108-11eb-9415-b0f6c6e96b3e.png)
![Virginia](https://user-images.githubusercontent.com/67207788/96364312-08347c00-1108-11eb-9caa-7d23b885b5d6.png)
![Washington](https://user-images.githubusercontent.com/67207788/96364313-08cd1280-1108-11eb-8151-a1486470d06b.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/96364314-0965a900-1108-11eb-91d1-8312360b4511.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/96364315-09fe3f80-1108-11eb-8674-7e08aaa4de51.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/96364316-0a96d600-1108-11eb-897b-c9ce7b3bd90f.png)



