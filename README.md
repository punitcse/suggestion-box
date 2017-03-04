# README

# It is a simple app for accepting suggestion and feedbacks.

### API End point

### Submit Feedback

  # End point for submitting feedback

```
  /api/v1/topics/1/submit_feedback?questions_attributes[0][id]=1&questions_attributes[0][answers_attributes][0][content]=this is new text
```

# Params

```
| PARAMETER                                                       | VALUE                            | REQUIRED |
|:----------------------------------------------------------------|:---------------------------------|:---------|
| questions_attributes[0][id]                                     | 1                                | YES      |
| questions_attributes[0][answer_attributes][0][content]          | here is the answer               | YES      |
| questions_attributes[1][id]                                     | 2                                | YES      |
| questions_attributes[1][answer_attributes][1][content]          | secons answer                    | YES      |


```
