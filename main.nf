#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process failIfEven {
  errorStrategy "ignore"

  input:
    val x
  output:
    stdout
  script:
    if( x % 2 == 0 )
    """
    exit 1
    """

    else
    """
    echo '$x'
    """
}

workflow {
  Channel.of(1, 2, 3, 4) | failIfEven | view
}
