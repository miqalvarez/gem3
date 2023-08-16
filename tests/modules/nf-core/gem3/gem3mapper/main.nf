#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GEM3_GEM3MAPPER } from '../../../../../modules/nf-core/gem3/gem3mapper/main.nf'

workflow test_gem3_gem3mapper {
    
    index = [
        [ id:'test', single_end:true ], // meta map
        [
            file("/home/imfx/curr_work/sarek/data/indexes/Tri.gem" , checkIfExists: true)

        ]
    ]
    fastq = [
        [ id:'test', single_end:true ], // meta map
        [
            file("/home/imfx/curr_work/sarek/data/fastas/SRR935389.fastq", checkIfExists: true)
        ]
    ]

    GEM3_GEM3MAPPER ( index, fastq )
}
