Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955598;
	b=JBCmWd6Kl+mGWQ/3wEVlnF1U6xU8AK25Zeo2YgPf3mh9DM/KePcu5k6VoWxlmBrdxdHF
	 FTio0nsDpieI6GxQHpdoDU7Q9DJfBpI6AEteteW+XXi9RgXE7j4cK46i7OGxxsFgS4gpJ
	 BLkUoaqt6CYATMrecBUiwfQJyxIGogJitHouZYSwbkO9OxCA2vhxwJf0XJhDdOByz9uYH
	 rR640QlR30wq19hvFPCZl3dLL4duJwByNv1uwA80V+OqqeKBahlnyyYV501QHFzPskMvO
	 Bj0LP03SxLhXotfwkHNyi6AmsJFWADHIrHu+3zYbdqZfcMIbFWuiLolFM+Tr4bI/37Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955598;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=3bFobh93H5Y9gH9JLlZYlof8ARaWu2vaQTy0fe8lDcw=;
	b=lntnr2qjhC7h5eujt+Ql+FXsRANwj7ogkl7kcrcM2exsQ6wYYp/2LTMzbGbY2eIgInFI
	 zOIfpCnJsj4RxrHwAU8oZzIxSMsO3Z30BG1Jh9SqaMLutnTj20yo4bOs2b+Gp300ZX6EA
	 xm+s5J8fXA9lFvMroE618arGi5CwgWLxff4TrckGw8NhGL7GfBRR/kbwpmGn/gkPR6Esh
	 ii8a/us4qgZT7r95lVDtHfhb0kRttdyVn0CvI9NCPQNoYWAceVJ1npkob8IWVjF5vM0Oq
	 eJ09hMhNsLIYTSI8XStADtXsCsQFiM7C7tVhVz81jvPVeYh8C3ZLwLRykAkNokRy/Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=YA7SgByQ;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71547606A31C;
	Tue, 17 Nov 2026 22:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71547606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=YA7SgByQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=3bFobh93H5Y9gH9JLlZYlof8ARaWu2vaQTy0fe8lDcw=; b=YA7SgByQcrhKs/jSWI3mztvIXJ
	n6xejJ9MdEAwC+vwS2RNFmZs5dMFzOAID9kXIrfMeFqV5gprabk8OlZbesGxjm31ZAyrB1tBneSpl
	MDJ2vgsVlbQ75UDhMoAMU+dYGBAtSUqYHp6/IvyeJZZ2gI58YO+ft4MVjJMwvuFTb5U0x3+BeJQxN
	K3fwL1iU7geT8C1z6/0+Jw7hJNGm5HALkvYR4aYTiF2W0uW++m4nvTKVCUSGJsd+I8FYUiICp3cDm
	fNRY8W5d+lD9loSSOkgS57VNG2BinM4tAyVT72YEdaP8jO+Q8+5yaU5z+Dxl/QrQIv8nDKr9wZ6uo
	zrWB4EMA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTRwi-00000001VKY-3KAu;
	Tue, 17 Nov 2026 16:46:37 -0600
Message-ID: <c2df58c9-6ddb-4125-aa1f-897e90b33e9d@deltatee.com>
Date: Tue, 17 Nov 2026 16:46:36 -0600
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
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261117165135.746241-1-logang@deltatee.com>
 <20261117165135.746241-7-logang@deltatee.com>
 <avyrd_b0yQ4Nqk-O@lizhi-Precision-Tower-5810>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <avyrd_b0yQ4Nqk-O@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: Frank.li@oss.nxp.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, sashiko-bot@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v3 6/6] dmaengine: plx_dma: don't invoke client callbacks
 with ring_lock held
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-11-17 13:31, Frank Li wrote:
> On Tue, Nov 17, 2026 at 10:51:35AM -0600, Logan Gunthorpe wrote:
>> @@ -166,22 +171,35 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
>>
>>  		dma_cookie_complete(&desc->txd);
>>  		dma_descriptor_unmap(&desc->txd);
>> -		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
>> +		dmaengine_desc_get_callback(&desc->txd, &cb);
>>  		desc->txd.callback = NULL;
>>  		desc->txd.callback_result = NULL;
>> -
>>  		plxdev->tail++;
>> +
>> +		spin_unlock_bh(&plxdev->ring_lock);
>> +		dmaengine_desc_callback_invoke(&cb, &res);
> 
> Common method is slice to local complete queue in ring_lock. Then unlock
> ring_lock after while loop. Then invoke cb in complete queue.
The PLX driver has no software queue. The hardware queue is large enough
that having a software queue would have been wasted overhead. So the
virt-dma pattern doesn't apply here. I'd really rather avoid adding a
whole other software queue just to fix this issue that isn't that complex.

Logan
