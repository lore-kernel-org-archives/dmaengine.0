Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033261;
	b=3bmpgOJ7vvBiDdwhCMLO43GJvQ+I6akKA0dJjLTxWQpgb9zEGMw5162dwEYtvDTFgaWg
	 QSqwoD3s8kqR2vrQnZYX4ODAN5F9VHy2wG0klslMN8vrThOMTxeByYwcvzgnALZ6fQP6l
	 MKxy114ZB19ETAYEz2YyDinkuYLDYurYoMNl1LBwanL3wiQpcETLXKEyCX1sTkamnqwol
	 Y7rSnIjh+rwYldMuqZmwXI13flHRiGIbig/rIoEE4teDVRNrjzwMxYom6NXAOJjaktbuO
	 dULVkXK9VcINLUoBETlX8YDV7c02FY7psLK+j2CwBlnEIjfMhHIl7Mtla47vdEL+NFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033261;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=y90lC37wa0PlLUX7xmgJNd03UPiku5qNrfxPtpv0gK8=;
	b=O4ve2fRwxWHLG+1Jzk1geZSOhWo09QAXX+OXJHRTOtuLEGVF5wU1k1wW+rXmu+Vaj2XB
	 NA3xhZu73OBX5jcH+lkXPpptueO7ytfBfTwd7feyFJ9r5CjCz110Y18rluM3Ndeyoc9Di
	 7zARaR/orfRwEOKBeQOenUXyUxCs2gQqv9sNyajKq7m/4eFYG4dxrY83BXmnJq0K/2PiS
	 Glm1IvJJv2PgjVj4o8ssO/lo5y7nz3sbjnYuA1cujLPlmJtqBJG0CvOm3qnUREsnbE8uG
	 ukCwcc2Iswld3oAuoX17ITVYedco0XpJIN21ZZEfAioZsRmwk85k1pc7jg5EGyxmh3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=LkeF7Avh;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=i47xj0mr;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6220606A32F;
	Wed, 18 Nov 2026 20:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6220606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=LkeF7Avh;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=i47xj0mr
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1795033233; bh=y90lC37wa0PlLUX7xmgJNd0
	3UPiku5qNrfxPtpv0gK8=; b=LkeF7AvhGsgveOtwSGHZ3qzsmlMfpAb8POsiWGGSfBERj9vd8U
	mKpxg+U0DCSDx3uB7OJOKi4cUl8/89FcXQB0Ma4QPUvlR/L0j3arT5vuILk77EFjnCn6Lqu2nzI
	Mie5WWw9QnLcbb6UiyvJPU9Jcs3OHnKF87WumKAgUVdose/c0eoq0VkYCxRh3OWfShVgtTjGnZD
	1uvPt2RWBT7EHL8udZ4FE42SRxSl/ney1AqYLLT4qI4Bx7pg2tyoilr81rDn2KpxP1Eu6tj1zii
	Yf57TQ5beBAvCudyJxlpPgOuxXIL/9qq0Il/mN/dY+DRuw+rIzVZcbHTtu68/26LcOg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1795033233; bh=y90lC37wa0PlLUX7xmgJNd0
	3UPiku5qNrfxPtpv0gK8=; b=i47xj0mrO8qp2Rds5E4bf5MlnKHkgDp1t424z0GSQUXT4jQNFR
	0mO4q5t1WAqps2gMM3nQANrU2WQZuj9BlHBQ==;
Message-ID: <1f72ee6d-a525-4df3-a37c-a4f0c3b7b6cb@mainlining.org>
Date: Wed, 18 Nov 2026 23:20:32 +0300
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dmaengine: Add support for immediate commands in the
 client API
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, dmaengine@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Sireesh Kodali <sireeshkodali1@gmail.com>
References: <20261115-qcom-bam-dma-immediate-v1-0-9a0df4ca3be1@mainlining.org>
 <20261115-qcom-bam-dma-immediate-v1-2-9a0df4ca3be1@mainlining.org>
 <av4Eis87C7QBxkd4@SMW015318>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <av4Eis87C7QBxkd4@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


18.11.2026 23:03, Frank Li пишет:
> On Sun, Nov 15, 2026 at 05:02:44PM +0300, Nickolay Goppen wrote:
>> [You don't often get email from setotau@mainlining.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> From: Sireesh Kodali <sireeshkodali1@gmail.com>
>>
>> Immediate commands are needed by the IPA network driver, so that it can
>> send commands via BAM to the IPA microcontroller.
>>
>> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
>>   include/linux/dmaengine.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
>> index 805668fbe437..56c49254ed04 100644
>> --- a/include/linux/dmaengine.h
>> +++ b/include/linux/dmaengine.h
>> @@ -200,6 +200,9 @@ struct dma_vec {
>>    *  transaction is marked with DMA_PREP_REPEAT will cause the new transaction
>>    *  to never be processed and stay in the issued queue forever. The flag is
>>    *  ignored if the previous transaction is not a repeated transaction.
>> + *  @DMA_PREP_IMM_CMD: tell the driver that the data passed to the DMA API is
>> + *  immediate command data and the descriptor should be in a different format
>> + *  from the normal data and descriptor
> does dmaengine_desc_attach_metadata() work for your case?
Sorry, I don't get your question. Can you explain?
> Frank
>
>>    */
>>   enum dma_ctrl_flags {
>>          DMA_PREP_INTERRUPT = (1 << 0),
>> @@ -212,6 +215,7 @@ enum dma_ctrl_flags {
>>          DMA_PREP_CMD = (1 << 7),
>>          DMA_PREP_REPEAT = (1 << 8),
>>          DMA_PREP_LOAD_EOT = (1 << 9),
>> +       DMA_PREP_IMM_CMD = (1 << 10),
>>   };
>>
>>   /**
>>
>> --
>> 2.56.1

-- 
Best regards,
Nickolay
