As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on November 14, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.



![Alabama](https://user-images.githubusercontent.com/67207788/99181480-f17c4780-26fc-11eb-9e23-a4b4f73ada4a.png)
![Alaska](https://user-images.githubusercontent.com/67207788/99181481-f3dea180-26fc-11eb-86f1-fd33714b4e14.png)
![Arizona](https://user-images.githubusercontent.com/67207788/99181482-f4773800-26fc-11eb-81a7-da474d461c0d.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/99181484-f5a86500-26fc-11eb-920b-d780b4574f58.png)
![California](https://user-images.githubusercontent.com/67207788/99181486-f8a35580-26fc-11eb-86dd-718a2ed2114c.png)
![Colorado](https://user-images.githubusercontent.com/67207788/99181487-f9d48280-26fc-11eb-8b24-404e8daff080.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/99181488-fb05af80-26fc-11eb-9413-a14f4373d527.png)
![Delaware](https://user-images.githubusercontent.com/67207788/99181490-fc36dc80-26fc-11eb-99a9-a55ef3d3b2b1.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/99181493-fe00a000-26fc-11eb-977a-ae4048210208.png)
![Florida](https://user-images.githubusercontent.com/67207788/99181494-ff31cd00-26fc-11eb-8a78-401ec14b7742.png)
![Georgia](https://user-images.githubusercontent.com/67207788/99181497-0062fa00-26fd-11eb-9ff9-dc6d4c0348fb.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/99181499-01942700-26fd-11eb-82e5-330c835affd2.png)
![Idaho](https://user-images.githubusercontent.com/67207788/99181500-035dea80-26fd-11eb-8d6e-c3e4465aa542.png)
![Illinois](https://user-images.githubusercontent.com/67207788/99181502-0527ae00-26fd-11eb-870c-f89e68b03880.png)
![Indiana](https://user-images.githubusercontent.com/67207788/99181504-06f17180-26fd-11eb-9daf-97060e53dbdc.png)
![Iowa](https://user-images.githubusercontent.com/67207788/99181505-078a0800-26fd-11eb-8f52-94849c3f7103.png)
![Kansas](https://user-images.githubusercontent.com/67207788/99181506-0953cb80-26fd-11eb-914a-18a362e09cd0.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/99181507-0a84f880-26fd-11eb-9a53-690c6d377479.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/99181508-0bb62580-26fd-11eb-89d9-854cb8e75a93.png)
![Maine](https://user-images.githubusercontent.com/67207788/99181509-0ce75280-26fd-11eb-92c4-a3507a164e12.png)
![Maryland](https://user-images.githubusercontent.com/67207788/99181511-0eb11600-26fd-11eb-9ec0-52ac325a4a9e.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/99181512-0fe24300-26fd-11eb-8482-32a0211015ae.png)
![Michigan](https://user-images.githubusercontent.com/67207788/99181516-11137000-26fd-11eb-9567-66da68da096c.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/99181518-12dd3380-26fd-11eb-981c-e87b902094f9.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/99181520-14a6f700-26fd-11eb-8fbe-0f6ed3b07fc2.png)
![Missouri](https://user-images.githubusercontent.com/67207788/99181521-15d82400-26fd-11eb-8f75-8fb51fb6a64c.png)
![Montana](https://user-images.githubusercontent.com/67207788/99181523-17095100-26fd-11eb-90aa-d6c2f5274491.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/99181524-183a7e00-26fd-11eb-9158-56018ccdaad1.png)
![Nevada](https://user-images.githubusercontent.com/67207788/99181525-196bab00-26fd-11eb-8635-a35978d8e1c9.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/99181527-1a9cd800-26fd-11eb-9241-75daad975daa.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/99181528-1bce0500-26fd-11eb-893e-1ddae5b95fc0.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/99181530-1d97c880-26fd-11eb-995c-aca7decf9934.png)
![New York](https://user-images.githubusercontent.com/67207788/99181531-1ec8f580-26fd-11eb-8d42-4da6d6dcf6ea.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/99181532-2092b900-26fd-11eb-81e8-51a5c821466e.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/99181533-21c3e600-26fd-11eb-99de-b69385d9d0a7.png)
![Ohio](https://user-images.githubusercontent.com/67207788/99181534-22f51300-26fd-11eb-9a5a-e2c75ee0e2b3.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/99181535-24264000-26fd-11eb-8d2b-db33b9862243.png)
![Oregon](https://user-images.githubusercontent.com/67207788/99181538-25576d00-26fd-11eb-9717-28a8a2c69213.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/99181539-27b9c700-26fd-11eb-9406-74c6e323ed8e.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/99181540-28eaf400-26fd-11eb-849c-11b2929e18e8.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/99181543-2a1c2100-26fd-11eb-8e27-f19953f9078d.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/99181545-2b4d4e00-26fd-11eb-9950-3d7958341a4d.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/99181548-2c7e7b00-26fd-11eb-9925-c8b5be3a53be.png)
![Texas](https://user-images.githubusercontent.com/67207788/99181550-2dafa800-26fd-11eb-9a03-6f89fd39f335.png)
![Utah](https://user-images.githubusercontent.com/67207788/99181552-2f796b80-26fd-11eb-99c5-6de56adb14dc.png)
![Vermont](https://user-images.githubusercontent.com/67207788/99181553-30120200-26fd-11eb-8a48-302ca8e99a71.png)
![Virginia](https://user-images.githubusercontent.com/67207788/99181554-31432f00-26fd-11eb-9b46-e9240e3dcd89.png)
![Washington](https://user-images.githubusercontent.com/67207788/99181555-32745c00-26fd-11eb-8a1c-cb6cbc8aa7b8.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/99181557-33a58900-26fd-11eb-9269-3c34e3233d58.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/99181559-34d6b600-26fd-11eb-8440-a1a605a8bdce.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/99181560-3607e300-26fd-11eb-97f6-746b9281a69f.png)


