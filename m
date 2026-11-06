Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006798;
	b=dWjPfgc5zJ0exfoxGp4tFmW/VY0XozqF7FcsA/+Pcx5oq07ogImxoev9OD7J6ejuv/DC
	 DlebNvEIxFu7NEYIFHfdk3lA16aARCVNQemwhyKL5mVAZ0f9SY3fMHot5adpZjelvEB/m
	 rnbfs55N8nR6T9Pb6q1bgV+X3sPefOj1a3/V1NHmpAq90aMzPqtBW2Wn7YgeWzttX97iT
	 ayr5Uc2BCFxc/7HsmsCe7+1W5luBws//ZQhQTxap4m464fXqH6tGCODVNn81dEd3GH5I2
	 m+QgcbxNDLNUKbX21I5QbPbUUC04qIY3UlCiVoUakzMu/pKAQbAtPRsn14fgXgSBJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006798;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=YA2K+tBmi59Gs8vVxIer79GUsZTRA1u+SaplIyMF1qk=;
	b=jK0ECxLPI+9rRVwMAlB8D2/RMVDAgxAA+9xu09FGjKVi3rfaT61/+VhMtpA5nJw18yi1
	 8KwHcXOL5uWA4x8YU/QZU5VimD+xQL1n0he8pxM/1pqoI5+VhjE0goi/ZU5JstsUVuALP
	 viAKk3ZWftm8BCWR0E4Nh0HI0bJhiIpvxKDcTWJh7xBVoxq/JniO5Faqrqs/POGlyEwdj
	 Fyhp4LXOmVOy2zwsxa8vKqiguZzVlZfz1u+w/Crr1UDtBplvOyHMnCUH3yVixyF1elN9E
	 eGYYHg/PAfLTt3S8LapqdBzTq+w79xY6DGARsYHpvyBgITYwX2AgZJbkvUwHlNdRACw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=CMV2wtNW;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3774606A32C;
	Fri,  6 Nov 2026 23:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3774606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=CMV2wtNW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=YA2K+tBmi59Gs8vVxIer79GUsZTRA1u+SaplIyMF1qk=; b=CMV2wtNWvdYbCHl/f3FRyJ0j0k
	ZJYV5TpWl354Bfe/wpouFdl9X7SBm7APluZyKqXw9EHxyYLdPldV04W7PymwXehleKA70NparqkFD
	z2Yi1y1S3Sq+EYX1noB3y/qLac2ji3ZodW5dSgsTrcJUb2Jjpfq+IeQrEXVWQM9IObnk+2pY9jfnZ
	c9xnVMlm2AlVmFaXhrcqa+t+DJEUN3Hk8PUWVM8GBxg+r9gQWdMD/59SyP1GLDkLaYJ3Q/zze8wja
	6NN8ew+MtjxC5pxvgG3Sa8govPeMt0FivA8NPcwgxAXOT70FifbSHuF2CBB1cjedV+EDsGpZFWomb
	iec5028A==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xPT7O-00000001dml-0Ehj;
	Fri, 06 Nov 2026 17:13:10 -0600
Message-ID: <5deeec6f-9dff-40f7-93cc-5bb140ca9901@deltatee.com>
Date: Fri, 6 Nov 2026 16:13:08 -0700
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
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-5-logang@deltatee.com>
 <au4SwnmfSotzKalT@lizhi-Precision-Tower-5810>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <au4SwnmfSotzKalT@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: Frank.li@oss.nxp.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, sashiko-bot@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH 4/6] dmaengine: plx_dma: add dma_rmb() after observing
 write-back status
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Thanks for the reviews, I've included your tags in the patches I'll send
next week.

On 2026-11-06 10:47, Frank Li wrote:
> On Tue, Nov 03, 2026 at 09:51:59AM -0600, Logan Gunthorpe wrote:
>> +		/*
>> +		 * Ensure the write-back status is read before the
>> +		 * completed transfer's payload.
>> +		 */
>> +		dma_rmb();
>> +
> 
> Is it false alarm by sashiko? follow code have dependence with 'flags'.
> 
> which part in Documentation/memory-barriers.txt show here need dma_rmb()?

Yes, this stuff always confuses me to no end. But I'm pretty sure it is
correct so let me try to explain.

The two actions in question are:

1. read desc->hw->flags_and_size and check if VALID is clear
2. read the destination buffer which may happen in:
   a. dma_unmap_page() via dmaengine_unmap() in the case of a bounce
      buffer being used
   b. a calling driver's callback or processing after polling with
      tx_status()

On a weakly ordered CPU like arm64, nothing forces load 2 to happen
after load 1, even though load 2 is only reached when load 1 says
"done". The CPU predicts that (flags & VALID) condition won't be taken
and issues load 2 early. If the device hadn't finished writing at that
moment, load 2 returns stale data. When load 1 then confirms the
prediction, nothing gets redone, and the stale data is used. That's the
"load-load control dependency" case in memory-barriers.txt. dma_rmb()
stops loads after it from being satisfied before loads ahead of it.

I've tried to improve the comment on the dma_rmb() call to hopefully be
more clear on this point and I'll put the above text as the commit
message seeing I think it is clearer for when I send the series again.

Logan

