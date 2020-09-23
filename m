Return-Path: <SRS0=cXJo=DA=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2F3C4727E
	for <dmaengine@archiver.kernel.org>; Wed, 23 Sep 2020 15:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C81442223E
	for <dmaengine@archiver.kernel.org>; Wed, 23 Sep 2020 15:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgIWPnQ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 23 Sep 2020 11:43:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:1063 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIWPnN (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 23 Sep 2020 11:43:13 -0400
IronPort-SDR: Dt5xNlbbQCH4XqrBZziEIPiHRifNNRg9bZwDqXVp9AUPg9joRUBK71fYiWpuz4y6AxXnke+1qf
 JGj8jzOqp3rQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148579461"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="148579461"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 08:43:13 -0700
IronPort-SDR: 2AZ0m9Y2dPtWynb9Gm8YNyv4Ff5NKf4Ice95TNKKFoyEmiLaf1Xakefnk5FaCt2nZ19EOCjGdU
 K3HQV1dscf3A==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="486484542"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.212.218.1]) ([10.212.218.1])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 08:43:12 -0700
Subject: Re: [PATCH v4 1/5] x86/asm: move the raw asm in iosubmit_cmds512() to
 special_insns.h
To:     Borislav Petkov <bp@alien8.de>
Cc:     vkoul@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        dan.j.williams@intel.com, tony.luck@intel.com, jing.lin@intel.com,
        ashok.raj@intel.com, sanjay.k.kumar@intel.com,
        fenghua.yu@intel.com, kevin.tian@intel.com,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <160037680630.3777.16356270178889649944.stgit@djiang5-desk3.ch.intel.com>
 <160037731654.3777.18071122574577972463.stgit@djiang5-desk3.ch.intel.com>
 <20200923104158.GG28545@zn.tnic>
From:   Dave Jiang <dave.jiang@intel.com>
Message-ID: <c38406b7-f1d1-35d8-8015-bacce7a52226@intel.com>
Date:   Wed, 23 Sep 2020 08:43:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923104158.GG28545@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org



On 9/23/2020 3:41 AM, Borislav Petkov wrote:
>> Subject: Re: [PATCH v4 1/5] x86/asm: move the raw asm in iosubmit_cmds512() to special_insns.h
> 
> Start patch name with a capital letter: "Move the asm definition.."
> 
> Also, calling stuff "raw" and "core" is misleading in the kernel context
> - you wanna say simply: "Carve out a generic movdir64b() helper... "

Ok I will update

> 
> On Thu, Sep 17, 2020 at 02:15:16PM -0700, Dave Jiang wrote:
>> diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
>> index 59a3e13204c3..7bc8e714f37e 100644
>> --- a/arch/x86/include/asm/special_insns.h
>> +++ b/arch/x86/include/asm/special_insns.h
>> @@ -234,6 +234,23 @@ static inline void clwb(volatile void *__p)
>>   
>>   #define nop() asm volatile ("nop")
>>   
>> +static inline void movdir64b(void *__dst, const void *src)
> 
> Make __dst be the function local variable name and keep "dst", i.e.,
> without the underscores, the function parameter name.

Ok will fix

> 
>> +	/*
>> +	 * Note that this isn't an "on-stack copy", just definition of "dst"
>> +	 * as a pointer to 64-bytes of stuff that is going to be overwritten.
>> +	 * In the MOVDIR64B case that may be needed as you can use the
>> +	 * MOVDIR64B instruction to copy arbitrary memory around. This trick
>> +	 * lets the compiler know how much gets clobbered.
>> +	 */
>> +	volatile struct { char _[64]; } *dst = __dst;
>> +
>> +	/* MOVDIR64B [rdx], rax */
>> +	asm volatile(".byte 0x66, 0x0f, 0x38, 0xf8, 0x02"
>> +		     : "=m" (dst)
>> +		     : "d" (src), "a" (dst));
>> +}
>> +
>>   #endif /* __KERNEL__ */
>>   
>>   #endif /* _ASM_X86_SPECIAL_INSNS_H */
>>
> 
