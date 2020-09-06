As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled “A Geotemporal Clustering Model for COVID-19 Projection” proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on September 5, 2020.

![Alabama](https://user-images.githubusercontent.com/67207788/92319200-101adf80-efe4-11ea-96b5-d8b0815b8d5b.png)
![Alaska](https://user-images.githubusercontent.com/67207788/92319201-114c0c80-efe4-11ea-89b1-f54a1b0c2d2e.png)
![Arizona](https://user-images.githubusercontent.com/67207788/92319202-11e4a300-efe4-11ea-8095-6a641ecfbec2.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/92319203-127d3980-efe4-11ea-9604-2fd68242a47e.png)
![California](https://user-images.githubusercontent.com/67207788/92319204-127d3980-efe4-11ea-9df0-e139e517a400.png)
![Colorado](https://user-images.githubusercontent.com/67207788/92319205-1315d000-efe4-11ea-9509-8eb6dda0658f.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/92319206-1315d000-efe4-11ea-806f-16da301e4696.png)
![Delaware](https://user-images.githubusercontent.com/67207788/92319207-1315d000-efe4-11ea-8159-5723e82abd70.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/92319208-13ae6680-efe4-11ea-8cf5-f2ae8a6314fa.png)
![Florida](https://user-images.githubusercontent.com/67207788/92319209-13ae6680-efe4-11ea-9b5b-cc29ea415384.png)
![Georgia](https://user-images.githubusercontent.com/67207788/92319210-13ae6680-efe4-11ea-853b-a68697060fdf.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/92319211-1446fd00-efe4-11ea-8ccb-98200035d75b.png)
![Idaho](https://user-images.githubusercontent.com/67207788/92319213-1446fd00-efe4-11ea-976d-4bb0c3c48de5.png)
![Illinois](https://user-images.githubusercontent.com/67207788/92319214-1446fd00-efe4-11ea-835d-a5e91a150bc2.png)
![Indiana](https://user-images.githubusercontent.com/67207788/92319216-14df9380-efe4-11ea-8b55-9c224adb5264.png)
![Iowa](https://user-images.githubusercontent.com/67207788/92319217-14df9380-efe4-11ea-9233-425bbb51db18.png)
![Kansas](https://user-images.githubusercontent.com/67207788/92319218-14df9380-efe4-11ea-9810-b3756983cfb0.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/92319219-14df9380-efe4-11ea-861b-e36cb6f3201e.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/92319221-15782a00-efe4-11ea-9b05-d717638df4b2.png)
![Maine](https://user-images.githubusercontent.com/67207788/92319222-15782a00-efe4-11ea-8cf5-08eeb9d3cb5d.png)
![Maryland](https://user-images.githubusercontent.com/67207788/92319223-15782a00-efe4-11ea-82b6-13dadf47f902.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/92319224-1610c080-efe4-11ea-8f64-7eb3f8e57a8b.png)
![Michigan](https://user-images.githubusercontent.com/67207788/92319225-1610c080-efe4-11ea-8875-551f44ce126a.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/92319226-1610c080-efe4-11ea-9925-3677b6aec456.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/92319227-1610c080-efe4-11ea-97b5-73e4c2331665.png)
![Missouri](https://user-images.githubusercontent.com/67207788/92319228-16a95700-efe4-11ea-9f97-278c49ad5f1b.png)
![Montana](https://user-images.githubusercontent.com/67207788/92319229-16a95700-efe4-11ea-9603-325343ef1d1b.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/92319230-16a95700-efe4-11ea-8230-a33cd6f39f83.png)
![Nevada](https://user-images.githubusercontent.com/67207788/92319231-1741ed80-efe4-11ea-9550-f2d6ccce8ad4.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/92319232-1741ed80-efe4-11ea-90c2-3a79e6261e18.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/92319233-1741ed80-efe4-11ea-8758-b216af081da0.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/92319234-1741ed80-efe4-11ea-8549-d1dc38383afe.png)
![New York](https://user-images.githubusercontent.com/67207788/92319238-190bb100-efe4-11ea-9f0c-5959e13a8af2.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/92319239-190bb100-efe4-11ea-8152-c347947f02b6.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/92319240-19a44780-efe4-11ea-91be-046e0a10db8e.png)
![Ohio](https://user-images.githubusercontent.com/67207788/92319241-19a44780-efe4-11ea-8567-09fc4adb2dd9.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/92319242-19a44780-efe4-11ea-8c94-54636244b694.png)
![Oregon](https://user-images.githubusercontent.com/67207788/92319243-1a3cde00-efe4-11ea-90df-585428e82066.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/92319244-1a3cde00-efe4-11ea-8380-3277bd3b488f.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/92319245-1a3cde00-efe4-11ea-87ee-e012bda363f8.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/92319246-1ad57480-efe4-11ea-98fa-1d26ecf0df64.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/92319247-1ad57480-efe4-11ea-99c4-763d21c1656d.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/92319248-1ad57480-efe4-11ea-9da4-a344472e34ee.png)
![Texas](https://user-images.githubusercontent.com/67207788/92319250-1b6e0b00-efe4-11ea-97cf-1e6f6871d101.png)
![Utah](https://user-images.githubusercontent.com/67207788/92319251-1b6e0b00-efe4-11ea-9fec-eec2ccefcc15.png)
![Vermont](https://user-images.githubusercontent.com/67207788/92319252-1b6e0b00-efe4-11ea-8732-3a41bdeeff48.png)
![Virginia](https://user-images.githubusercontent.com/67207788/92319253-1b6e0b00-efe4-11ea-92b1-223d1aff8e41.png)
![Washington](https://user-images.githubusercontent.com/67207788/92319254-1c06a180-efe4-11ea-919f-4fddb2ad1576.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/92319255-1c06a180-efe4-11ea-9fc1-b2705a45b3dc.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/92319256-1c9f3800-efe4-11ea-829f-657419235574.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/92319257-1c9f3800-efe4-11ea-9fc4-551cb63f02e7.png)


















































