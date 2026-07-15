Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D830BF70;
	Wed, 15 Jul 2026 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095232; cv=none; b=aDb/QVriVpoOe2YStSla5FQ9LVvJ9x5OGNmdVCSG9GAoy2rQqmpJd8U0QLydYGpN2XVUgzQauQpiYbIS5qC3v3saYpXRtCxvDA97tjZum14wsz/rBHPU6xablyuAQiDRSazmiNcc4DjHxgc00vKVJh/tDok2pG8lt99JWKVs1O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095232; c=relaxed/simple;
	bh=DR2GokEdTnlb2WGrPEPw2B8fvb2QXjSdklIfM2G3vCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3o+FJiThgvZgVvu4ZaYxjk9plCa2YjzmiGJ1Zz4nsD1KmxFqrh3URjdNP4PODORqG+3s43LrBJqUsgTUtz1STbREmMG3gMPU/wIlTSTmsc/1EwtW1w90+ro2CwV+8ideITQ2tzsXNXJtw7/zin8yJQb1eZjd/dwjnmt1NnQA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxKTiobV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxKTiobV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9989D1F000E9;
	Wed, 15 Jul 2026 06:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095231;
	bh=H4zdzfLRDStiKGmrtSSfqV1H+dlpl2uN4SMT+of529U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RxKTiobV+xAsou1nwS1/l07tNu3RScEhT0vV7jpDuG31A9nUC9xw7Rq4xm876aseV
	 u+JMv3/3J3n/3kqSkGb2tRtzf9NT5J4Nmre1/3CqM/SyTSU59Vf0nkrgAbS5UwhpDt
	 oGeSn/RQlopx1fPO1/vq4naOaAJU1bcmKK2wNFWK+EBUiebKONhEn4wrgZ3+5pP6Z4
	 mXZz1RemoC9oSzAs6ZmEDeqWm6YLnIZUqhylMWPGvHn/wZoT1BJdv3+Mb8tvAsE3ND
	 Zi3D3QhPluXoGw9KMrf9tPQJSpiBZj7xf2fA4gp1hv47R+FgpOUsFi41y75Vo6/137
	 VBV26dudZL/Tg==
Date: Wed, 15 Jul 2026 11:30:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>, stable@kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fl1-edma: Add error handling for
 devm_kasprintf
Message-ID: <alch-r9QvhyiblOC@vaman>
References: <178403257631.822807.3647660559296965382.b4-ty@kernel.org>
 <1ef78e50-0578-44cd-84ff-87a0f497c48f@web.de>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ef78e50-0578-44cd-84ff-87a0f497c48f@web.de>

On 14-07-26, 17:01, Markus Elfring wrote:
> > > Add error handling statement to fls_edma3_irq_init() for the
> > > devm_kasprintf call.
> …
> > Applied, thanks!
> > 
> > [1/1] dmaengine: fl1-edma: Add error handling for devm_kasprintf
> >       commit: bf1af4dfdc017dfe989c0dbcf0e608dc95f1d2cb
> 
> Frank Li requested a corrected patch subject.

Which was done while applying
bf1af4dfdc01 dmaengine: fsl-edma: Add error handling for devm_kasprintf

-- 
~Vinod
