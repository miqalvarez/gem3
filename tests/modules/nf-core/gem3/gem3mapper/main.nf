#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GEM3_GEM3MAPPER } from '../../../../../modules/nf-core/gem3/gem3mapper/main.nf'

workflow test_gem3_gem3mapper {
    
    input = [
        [ id:'test', single_end:true ], // meta map
        [
            file("../data/fastas/SRR935389.fastq", checkIfExists: true)
        ]
    ]
    input2 = [
        [ id:'test', single_end:true ], // meta map
        [
            file("../data/indexes/Tri.gem" , checkIfExists: true)
        ]
    ]

    GEM3_GEM3MAPPER ( input, input2 )
}
