Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938989;
	b=2UpYHaz4TxtGy3l7B15hfivJjKutXC1xMaCNYD5axHzFO+DezX/4OpuqIf8ObaXc0/+0
	 t3JlX1CkGAGkeK0WjCysGfyHoHckJOW7PBmPD/eyJY5u/4lSy0ohT5aI+CwqKFL3onrsV
	 u+TV7J4VzAtcH6aErKcnNQ6+0hkbk9jndGEjL5TMcdx8c6a7ttp/kZ/WpG4GxIe0GsLS4
	 tuMh04L5LRb6OI+Ub75A9tJTEzatCRI76SsB5mOchCmaBU/YfQzOp7x6pCU7J8gvCMCPv
	 vLv1ruomRqP8JMSL+hl64q2BOaNzCSMuuTBnIw1cdZYpjrfGsisvpz8mhrpsDs2DkPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
	b=pMj6vXSiCdHwVzKz68JLQez4xeP8ldQEY8gWnNKhoOetTLlspXP5/uqUGGsLiDj/rABY
	 uI7aQCZvUG3KCpmXnevx0zv2rNYFa824HuXVhZz+RWE/MrOfSzfvM2M6qOdFQE7wbeIFj
	 suDXmXPSEgkTpiljw5Ogwdl4gFbbk6pscJ+jIJD+/O/QtQti8NVRv4focqM5sG1KWzLqw
	 osvnNMSOZkqAg1su1tMb54/mZj28j0BLWv0Jb4TvVUB9oQgFC9/K/XFzkhIk2/fWLjjkw
	 YTCV8k7oQZa8Ne8hRTH6kquND7E5ZDZlX22e73jz70RFteDTpuJVEAq7JhUwInWi0uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A122606A332
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 18:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A122606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgkGfVq
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-92107df3f13so7354056d6.3
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794938987; x=1795543787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=YdgkGfVqKKui0aiLSvR6mWBKZ1+mzuRPsqTd1Sr0W+MZWL+4jDUMa6VxrqybHVoEOD
         /J9StWy33w6SStG5yfMJ1osxetxqx0DcvagahjDxFaoR5bvIK/sTcU9tLwx5smKDKl8z
         Thd3LDvAg2KozZedUmsFRZ7M/o2KonYaJ7dX9uNkiLmZm6olw5l3ytILQ2BH7q/LCTQZ
         hklXu99iDf3yimqo438LAdEHeUhdpzKPK1S2nLYqC+CIJNx5UEsxm3OYqhNRy22HA1Hw
         0o9ki1uwEKN/F5ZWTLAXZMa/9Jx7RmbhF5P3N2MbpK74vWTuOK4zl6bckElmrsmM0+vU
         2VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938987; x=1795543787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMrVATcUEwdpvgw6MI+dpJDmx6eLc4X7DAI9r1FJRWU=;
        b=06b2HfybxP+PCB/hdeN8D5fYwAGj9ZayjfJkUtd5z/psQr/LJr3V4fz42md/K29h5y
         fzZ/MFfVY3TO9kxfU9+RCO7tv2x0IDqP6G7X2AyG/S7ZxZ51LTErbitB+dTj0l1XeLwk
         mvUUOuTzIWzA1hpmY5xfTmmzRpjoZFiJ8WhPf67GOMJHs96IZ4MDx3hJgcIr8AESnwUl
         dzLeb5G1ZfYWjVorIoYAaGOsbty3hz8NdoAdRRf4XEmzhO0ypt9tTUGKJEWDMcLfClSR
         r2qTRZOWHsRkKT+W/6DJanNOhoSdLd6vvFnHbySKtucIaqMUmel1MMyY8RoAIg42dcHR
         d4Bg==
X-Forwarded-Encrypted: i=1; AL+hErHUUID7oOU6K8+cXPC/r+iONTDIGmaP1XyFsED4NnvGxWZBKxLyuHK/3uXOJ8fTu/8Z2TvHGP5pQWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rMV5NDhgNuM1AeiyfpDlsi3WTIOdojHs+A7V3zQxr9RQMPlNQ
	uSPG+19VWYYEkn+jSXjqSCkC7uwBJ4hCSCY2lKRYUbDuzoMLqyuZyH9q9vYE3G6Mlig=
X-Gm-Gg: AYBFou3JxPgNrD5CepfCu76DzRxasbSm2cQANjebyWCGkCuz5yC1DaGri320RMHFIVO
	qcdlTI5w0gu4h8sz+SmKJahuTEnh7p274EBMoyd2JgCWLcVG/jNYcGTVD7K6fpjytbmozLABtix
	IkKgFyd7pBRG5dbgp4QOg4WFxS8rHyRJBbiJo3tKWqvAz4HsP08CvfCl6f74lRgXRFNEvimDF7o
	KQvralqQ6Tz8ThiFaCL1zRr7tiXSIbo5K/ELAqBmv/a2EO+Wi/L5zwuwVMo8nnmJpehPU5XylRC
	oeneNqDidPZnnXuPcnCUCALFBj7Hqkj7cmW1Y+ZQ7nPGhP+nkCrBnm7fI8dL3FlVXNMS+ERz/6L
	hchtBfD14voO84BHqvaktYFUYVf3/GKsFq6x1sQVewbCo5OI19H11dOItt3e9XdS8LgZYxio5n8
	u3IjHyR+9p0n0EzcKtqjMp3AVUjG4JV2bFQmdwCT3QvmC0Fpfvf2UsEDv7FqI25d5fbXA8M5W9a
	9/0KTGitZes6f5UHs5rMBMIL3z07ytkYKxKcrGWhXj4c+q+f3iP9andaOpzA4pvaC7sCV+rG4OY
	HikuX80=
X-Received: by 2002:a05:620a:46a0:b0:949:6ec7:68e2 with SMTP id af79cd13be357-94999650610mr89698785a.79.1794938987121;
        Tue, 17 Nov 2026 10:09:47 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b5c1dsm1155175385a.33.2026.11.17.10.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:09:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNcn-0000000D06D-1Abm;
	Tue, 17 Nov 2026 14:09:45 -0400
Date: Tue, 17 Nov 2026 14:09:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peng Fan <peng.fan@linux.dev>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261117180945.GE2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avyGI6QmuZ3DUqc9@SMW015318>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avyGI6QmuZ3DUqc9@SMW015318>

On Tue, Nov 17, 2026 at 10:51:47AM -0600, Frank Li wrote:
> > > In dmaengine each channel is already modeled as a channel device (see
> > > dmaengine_chan_dev()), and this series puts those devices on a real bus
> > > (dmaengine_chan_bus_type) as a prerequisite. The DT child node simply
> > > describes that existing device, so its reg/interrupts/power-domains/iommus
> > > are attached per channel instead of as index-matched flat lists on the
> > > controller.
> >
> > If they are real devices then why can't they come out as platform
> > devices?
> 
> It cause complex when consumer to bindle channel dynmatically.
> 
> for example:
> 
> consumer_A
> {
> 	dmas = <&dma_provider ID>;
> }
> 
> if each channel is platform devices,
> 
> consumer_A
> {
>         dmas = <&dma_provider_chan0 ID>;
> }
> 
> Consumer_A will have to bindle to chan0. Actually, dma engine support bind
> to any free channel. It will be problem when there are not enough channels
> for all peripheral.

That seems like something you should be able to fix in a better way,
like by having the DT know which DMA devices are usable by a consumer
so it can be pooled.

> > I think you are overstating how independent they are. Many single
> > devices have per "channel" resources like MMIO and IRQs. That's
> > totally normal. It doesn't make the sub resources independent devices.
> >
> > AFAICT what you have here is some HW designer used SID where they
> > should have used SSID and you are trying to hack DT to make that
> > usable because Linux does not support a SID as SSID model today.
> >
> > Again, since this is the 3rd - 4th case like this, it seems like a
> > popular hardware choice and we should try to do better to make Linux
> > support if we can.
> 
> What's your prefer?

If a PCI device implemented something like this it would use PASID.

I have one device with many DMA streams is what PASID is for.

Recasting your multi-SID as PASID somehow seems like an interesting direction.

Jason
