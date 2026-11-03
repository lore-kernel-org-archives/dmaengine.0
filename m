Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726769;
	b=pgyE0JgiXr4g5tbeKe4lM0no/MfVOmrlegcUqtkA7f2AtFu8JqW9NaRCYtL/fqEL7yrh
	 7gpwdStACLeyZDXCvsUcX1QZbCa3JHbC9gyi0isz6Crisev+Pen4K+XOBHXZHjd5YX9oO
	 hQjYwVKhm96XsRiN8tLHmkr4NgQSvAltKcdh0OC2djRs98+pJQnpld5sPWORQMEm/DKv7
	 bfpqFu5B7qlff/0n5yqKW1LkMLpDy63sJFBakyryyDuA24hG4nzqbhZi+K4q9GsDQrsig
	 bCmVuikXRENIAYq6+xfxK6HpG54/KySb2freHHznt0ddAjJMs8aO+WnQO8ybdj0coNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726769;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=E5WStAwBpfyNBYTy/ureDul7n+/Y+GZa1Gdpaq/PwCg=;
	b=T5577/KTHbzcHIApDl14SoOJ0LawjXSx03WZpPMw5vbzQmlKovl4MPV0rlXp4yn5NfSk
	 2Il8H0dbb4kdmF6+WbVLf/glWwhiuIHciwKJVGcLWXbtDFjjuBObmc30hQPdt7lUw9G+H
	 0b23y6f2LRK9ZvEZrKCHtXXGa0ZQ+O0JEr2VazEQ39kcqhMcoEWMP6Uk7EvCLq/zGglqS
	 9RDcc4MOydulUUAFXqB5wn2Mexy4Slym5wK0WDz+jVwVcD8xcDiw/FwRiPWlvEnU2q2Tp
	 LiOfS1QOvpJz/ZLVzGeemXjLlFcbreT2yMfSk/OVw1DaVbXAuLVjN40ULl29CiHOfeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=k7eIVLga;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653AD606D806;
	Tue,  3 Nov 2026 17:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 653AD606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=k7eIVLga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=E5WStAwBpfyNBYTy/ureDul7n+/Y+GZa1Gdpaq/PwCg=; b=k7eIVLgaN7b4WDRY2YDKAtTkA2
	c2kJszkWXKjCWlhiyyI0ekmOOMBw5h8fb4/SCcih6ObZHaBy9sKFz5HNgsU8u+iI+BTvERpPHVhcE
	FhGepiTa9TUT9h8YjNFxcStN3XopzkYv7njqiFiDZVKapZ2KaDpmZs6nPhnCAhpEPDxuu3u0pMqou
	KqdUgdf/rc8GOURV4AXZqDxIKpOAcTet28wHvpxQJPTy/B7eND+utJZS9KBfa8TpL+fU9iEinkI1A
	ew+MwFtRTLz7k1yNEnSKCEyLP4NpOqtElkfDDSs+9UE8B1yrf8R8s+mEldpoH/LKqLydmpxcAz0Jo
	Oir7UsfA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOIGt-0000000934c-3W4x;
	Tue, 03 Nov 2026 11:26:08 -0600
Message-ID: <13275929-440b-44e4-a19a-d253a03c7d60@deltatee.com>
Date: Tue, 3 Nov 2026 10:26:07 -0700
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
To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-7-logang@deltatee.com>
 <sashiko-outbox-195706@kernel.org>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <sashiko-outbox-195706@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH 6/6] dmaengine: plx_dma: don't invoke client callbacks
 with ring_lock held
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-11-03 09:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dmaengine: plx_dma: premature teardown in plx_dma_free_chan_resources()
> - [Medium] dmaengine: plx_dma: race in plx_dma_process_desc() when dropping ring_lock

I've queued up a fix that I think will address both these issues.

I'll send a v2 series with the change and any other feedback in a week
or two.

Logan
