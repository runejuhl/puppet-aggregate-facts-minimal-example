node default {
  notify { "oh hai:
${facts['aggregate_fact_example']}
": }
}
