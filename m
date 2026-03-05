Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9D2D0603;
	Thu,  5 Mar 2026 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772736684; cv=none; b=LlPewXi6f4YVnmAq5VcHTJ3kW7yHHsGKx+l+tvUVjXO5RUyY0Dn/oWS2ptkbL0h4seL4H9sGWmvCW32sDX7DpQTC4gRbCq3erSRAVejvBPy48KaG7EepHWIbMJT9g3YG81tjAwPDJq8IVLrCA8f00bjckbxbdaOm5Eua6okXxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772736684; c=relaxed/simple;
	bh=1GgF5ewBhtDFNVjAPiltOyP7ObRzVQAXlo4zkq090Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Irmea64YxYf5Stu+4VvoLMb60esO3H+G3g8bW8ahj2pZke+Pm/hjonl86igAdSpVNfZXKlmjWKnI+SloYk80a7WDspwVXQ6bnvXLx7anbRtPe1F2svHF5re8rh7MmPHInxRU57fDU44CR8NuAm4koImtQTM07iedbwDd4BcOk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IufNYfav; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IufNYfav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772736683; x=1804272683;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1GgF5ewBhtDFNVjAPiltOyP7ObRzVQAXlo4zkq090Ec=;
  b=IufNYfavyeZZliRQduP6rP1NtSsSLuI0Ns861AZtgdViaxrexwvYOXHp
   SZOACO8LOrlLGgnrCIJJlLIgFHeHYnk+f880Hkf76Jioj/O4oAQzUO9+K
   pC7ymE7UThSwv0tuDynBa7aNUhthzv99Yqe4i3nNtwSVAtOwlXeN08IQd
   0uczThZ4yoDJ94P4CFAgVvxotZqPx8GF+Ogyt4WjB4w6089oZSwrihFZr
   IHVJxITn4Ef2gDPzeTxj3hZQqNsJpX/PIuHeHVZZgeefrHOiOIIssKIQl
   9qVy0CN6gG3h1/jvOziwX7FmCuCLQEttNYXST8dzf0B560ovxlw+1UHDR
   A==;
X-CSE-ConnectionGUID: A8Aj3+5kQ4Wy0c3aagp2yQ==
X-CSE-MsgGUID: uOLNi4/kSAe/oulsxMLCrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96453330"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="96453330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 10:51:22 -0800
X-CSE-ConnectionGUID: wI3tGPRBShiwmh8yVg7/Ow==
X-CSE-MsgGUID: dBmK92qsQAu8ON/9LyNMIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="241786888"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.109.42]) ([10.125.109.42])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 10:51:21 -0800
Message-ID: <8aac54f1-fc2f-4686-878e-456cdefccac4@intel.com>
Date: Thu, 5 Mar 2026 11:51:19 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dma: idxd: TLB translation fetch operation not supported despite
 PCI ATS enabled
To: Karim Manaouil <kmanaouil.dev@gmail.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305183206.ch43qpnof6q4lvvd@wrangler>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260305183206.ch43qpnof6q4lvvd@wrangler>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/5/26 11:32 AM, Karim Manaouil wrote:
> Hi Vinicius, Dave and others,
> 
> I am working on a potential mm feature leveraging the Intel DSA
> accelerator. I am trying to get the TLB translation fetch operation
> to work (described in section 8.3.11 in the spec [0]). However, I keep
> getting error code 0x10 which correponds to "operation not supported",
> despite that PCIe ATS is enabled.

Have you checked the op_cap sysfs attribute (OPCAP register) and see if the platform you are using supports the opcode? From the error code you are reporting, it appears the CPU you are using does not support that op. You may need a Granite Rapids (or equivalent gen) platform for that to be available. I don't recall that OP for DSA v1.0 which is on your SPR and EMR platforms.

DJ

> 
> I used idxd-config [1] and dsa-perf-micros [2] for testing as well as a
> kernel module. This happened both on shared and dedicated queues.
> 
> An example with [2] is given below
> 
> With [2], Create a shared queue with a single engine
> 
> # ./scripts/setup_dsa.sh -d dsa0 -w 1 -m s -e 1
> 
> Then run a 4KiB memmove job (opcode 3) with translation fetching (-X).
> 
> # dsa_perf_micros -n10 -s4k -i1 -k5 -w1 -o3 -X1
> dsa_perf_micros -n10 -s4k -i1 -k5 -w1 -o3 -X1
> blen                       4096
> bstride                    4096
> bstride                    4096
> nb_bufs                      10
> pg_size                       0
> wq_type                       1
> batch_sz                      1
> iter                          1
> nb_cpus                       1
> var_mmio                      0
> dma                           1
> verify                        1
> misc_flags                    0
> access_op[0]               Write
> access_op[1]               Write
> place_op[0]              Memory
> place_op[1]              Memory
> flags_cmask            ffffffff
> flags_smask                   0
> flags_nth_desc                1
> nb_numa_node                  1
> cpu_desc_work                 0
> Memory affinity
> CPUs in node 0:         -1 -1
> Buffer Offsets          0 0
> dsa_perf_micros: check_comp: desc[0] error
> desc addr: 0x7adf31986000
> desc[0]: 0x0a00000c00000000
> desc[1]: 0x00007adf31987000
> desc[2]: 0x0000650dabb381c0
> desc[3]: 0x0000000000000000
> desc[4]: 0x000000000000a000
> desc[5]: 0x0000000000000000
> desc[6]: 0x0000000000000000
> desc[7]: 0x0000000000000000
> dsa_perf_micros: print_status: Comp status 0x10
> dsa_perf_micros: main: test run failed
> 
> As you can see, it fails with completion status 0x10.
> 
> I also tried submitting this directly from the kernel on top of idxd. I
> prepared and submitted a dsa_hw_desc as follows (roughly)
> 
> struct dsa_hw_desc *hw;
> 
> hw->flags = 0;
> hw->opcode = DSA_OPCODE_TRANSL_FETCH;
> hw->transl_fetch_addr = sg_dma_address(&sg[i]);
> hw->region_size = sg_dma_len(&sg[i]);
> hw->region_stride = 4096;
> hw->priv = 0;
> 
> rc = idxd_submit_desc(wq, desc);
> 
> and I got the same error code 0x10 in the completion record.
> 
> I am on Linux kernel 6.17 on Ubuntu and I tried this on two different
> systems
> 
> 1) Dual socket Intel Sapphire Rapids 4th Gen Xeon(R) Gold 5418N
> 2) Single socket Intel Emerald Rapids 5th Gen Xeon(R) Gold 5512U
> 
> I had the same error on both.
> 
> lspci shows that PCI ATS features is enabled for DSA on both. As an
> example, on system (2):
> 
> # lspci -vvv -s 0000:f2:01.0
>         Capabilities: [220 v1] Address Translation Service (ATS)
>                 ATSCap: Invalidate Queue Depth: 00
>                 ATSCtl: Enable+, Smallest Translation Unit: 00
>         Capabilities: [230 v1] Process Address Space ID (PASID)
>                 PASIDCap: Exec- Priv+, Max PASID Width: 14
>                 PASIDCtl: Enable+ Exec- Priv+
>         Capabilities: [240 v1] Page Request Interface (PRI)
>                 PRICtl: Enable+ Reset-
>                 PRISta: RF- UPRGI- Stopped+
>                 Page Request Capacity: 00000200, Page Request Allocation: 00000200
>         Kernel driver in use: idxd
>         Kernel modules: idxd
> 
> And this is the output of accel-config list on system (2) for the example above
> 
> [
>   {
>     "dev":"dsa0",
>     "read_buffer_limit":0,
>     "max_groups":4,
>     "max_work_queues":8,
>     "max_engines":4,
>     "work_queue_size":128,
>     "numa_node":0,
>     "op_cap":"00000000,00000000,00000000,00000000,00000000,00000000,00000001,003f027d",
>     "gen_cap":"0x40915f0107",
>     "version":"0x100",
>     "state":"enabled",
>     "max_read_buffers":96,
>     "max_batch_size":1024,
>     "configurable":1,
>     "pasid_enabled":1,
>     "cdev_major":235,
>     "clients":0,
>     "groups":[
>       {
>         "dev":"group0.0",
>         "read_buffers_reserved":0,
>         "use_read_buffer_limit":0,
>         "read_buffers_allowed":96,
>         "grouped_workqueues":[
>           {
>             "dev":"wq0.0",
>             "mode":"shared",
>             "size":128,
>             "group_id":0,
>             "priority":10,
>             "block_on_fault":0,
>             "max_batch_size":512,
>             "max_transfer_size":2097152,
>             "cdev_minor":0,
>             "type":"user",
>             "name":"app0",
>             "driver_name":"user",
>             "threshold":128,
>             "ats_disable":0,
>             "state":"enabled",
>             "clients":0
>           }
>           }
>         ],
>         "grouped_engines":[
>           {
>             "dev":"engine0.0",
>             "group_id":0
>           }
>         ]
>       },
>       {
>         "dev":"group0.1",
>         "read_buffers_reserved":0,
>         "use_read_buffer_limit":0,
>         "read_buffers_allowed":96
>       },
>       {
>         "dev":"group0.2",
>         "read_buffers_reserved":0,
>         "use_read_buffer_limit":0,
>         "read_buffers_allowed":96
>       },
>       {
>         "dev":"group0.3",
>         "read_buffers_reserved":0,
>         "use_read_buffer_limit":0,
>         "read_buffers_allowed":96
>       }
>     ],
>     "ungrouped_engines":[
>       {
>         "dev":"engine0.1"
>       },
>       {
>         "dev":"engine0.2"
>       },
>       {
>         "dev":"engine0.3"
>       }
>     ]
>   }
> ]
> 
> I tried to debug a bit in the kernel, and IOMMU code in the kernel successfully calls
> pci_enable_ats() function at initialisation time. So I assume nothing is wrong with
> IOMMU, PCI root complex and BIOS options.
> 
> Do you have any clue how to get this to work? Or will it ever work in
> the first place on these systems? This is not documented anywhere.
> 
> Cheers
> 
> [0] https://cdrdv2-public.intel.com/857060/341204-006-intel-data-streaming-accelerator-spec.pdf
> [1] https://github.com/intel/idxd-config
> [2] https://github.com/intel/dsa-perf-micros/tree/main

