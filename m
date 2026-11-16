Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857424;
	b=aKHcMOWk9By0awFMqZTkHn9Ney7crw75t8r+Yr3VMF5+9EbwQ78r/hQkwM3gcD3DfS2A
	 xEgU9yNahlb8PxS/62iY+lvWLGNztSfLaqpJ6jHQarUzbh0XjL3qWU/O+/t60d5BmTA+e
	 EkXIJjGimqd4oEBJVCVl4e2NGxOGNf6xvBLieR7GXxh5aCHbljMLvOknBObLxtLZL24Uj
	 OBLXOpWiaDGCdUmB4427Cd9vHOkxt6UJSWVFPIOOepuq49XQvKbBrfBOVWJZxLhJYP69Z
	 qXqyTnvjXQtL+qawJ1Tc1WptYtEDsGeXe4uszV/4SJlEH4mJ8gtpc9SDnf3FJqxK+gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
	b=mzg2x6emUvnKukJWvDRzjWOJQGXNGM124BYjN6EqIN44VdNWmIlxFiMNDCsYX/JgB9jW
	 B4JVoPuTZPzl8DQaYr3XiiiaNeSqDx0HXRsxWZKjVqB7Je9Rh8lb2WD2z7C3+wqtA1p/S
	 QHeMTNJ3KDO2WrFDFvLf9ayMhF6++Ewa6dwnfH15ylQrN1BDtXgKpzDkiwWJpu1acRP4M
	 2/xoWhUIiJc4I6FhPM39Vivq2UtTVbTz+fFNzJFbsikidKMzQ4Y4ibW0+D7WrbZQR+6tU
	 Gk/cIlhTbohjHmgIJp9jdFFN8seLaW1tkvLVIAaWCr45WxNsctRQeC2DLHWWKr6ADVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EFB606A32C
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 19:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79EFB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E96WAHkT
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9497a167a6aso18904085a.1
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 11:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857423; x=1795462223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=E96WAHkT+sP92lQq8lfU7rpYkYmClz1BkPu1iXTnY8MIB//GemYHc5QdBt1ld40Smy
         acUqrFGAqUxCszfVw+pzy4SnJCfUKiX/A4Q+0gJXedFRj+sYatxoMGnyXMoUK+xgqxjR
         s4wgXwYNtTus15EIP5/qVjorQQoKK/mBth3DTSneehjsfS+0679AFf3GT8wrrI+TLrTG
         S67lGTnC4/NuArZMxsujuqU9DVFtqdgciQWqSBdOrH62D7p7LY8rnKE/kpe2Uczm3HkT
         7VhnHMuAAjm5NWwm6eproW22AIWHmXSjkJumB6jc+PP/hWJaqbaadKSgQjgzEdlnANOm
         VH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857423; x=1795462223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Y8Yw9LOdvyV/HcUuJyObmf9/gu6aH92RylQl5nKXvI=;
        b=BqYFO1WEE4NsbZbV5oOx6JeuZRj8hwS5ryFAwdJKadGri6U5YZaZyFW+rO58BH+MAS
         JO+jEb/ThJ9ofo7navAzr7XgBjHJi1X8c8IvlC0FksdzAfHl1w2ARL8PCfz/DtlJgves
         5SdMKlwpIsqA1ezvewKqYz+WnW3MMuUtSaPrhX82EC2PBPwdYB2HgS/AVi/8MOf+3Lrp
         oRaQtP4WpbWhgwWYXMDa6jRrvEeSASLMPQrbPXouVey2oQ0I7QijQ8CSw8icntnQV+FY
         U+9EIfRtt2XxREmSfR8L5hdo/Zo/8GEkBKba1962mvt6O4opJedGSmoQ1AIuQvZQYDSw
         63SQ==
X-Forwarded-Encrypted: i=1; AL+hErGwMoZK2IBUXfq4mZWAJ43knnTUF3dbLeqq6WnjnjiyLpnYXdyncW4RlkHusGmVdeJw9Jk51U0tWAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UkG7OLBEvbNwQfptOQ6mGz4VZEgrx8G99FiMyckdxLrL07Mbg
	bTBjOmRW83smemwRhdnNY/I/6oZU9b/VIusH6vltOmckD743i8ezaPZM/QMQ8UiUqSI=
X-Gm-Gg: AYBFou2RT+WCwUW+wYOqKHQ00K+EnWbPaYl5mJkK/Y01hWOriqwoiDDdu/HRMYyQVaX
	+iTGDglRzwqn61HR8Ef6envawSNoakGxELBvoujHI6hw8nLSbcCZqlywGzeylMaSBHZ385yuYWD
	eS9iKSOQyM+bSlSiv4LiUQnWfbPm9ojmVjAn4pDImKZ6MB67lN9OQphlu6zBJc/bFRRCxxZ5K/B
	JbHboTrqaY9zDxf1YaaNdx0/uhA+P1WaoyrwjBxCFsGpJKRNS0SpBXqCWPAbVexArIklCWqwLH3
	t11/L6nquU6obKiTFTKxnBoztcOkew+vB4P42Vta6tY3mLLh8dqgB+PeMWoh/r6LOwvBe4aAdPo
	EkBYcN33s7pCOb8FmlD4XOBXhjLiilGDsDJis4jAo8d2CEsKIfHQxqNe2XunEPzZ5aevHuMCgFM
	yjk2RDXRNoAExKtb6ph+VGVsk6tfpPtYxpMmjitBMZYN70GcBEcyPK/ngHMJFncVaSS6QXNpOIK
	RcWauc1Zv5Xo/zSEwox4f9I/EhZLP90rvHXsI9MShjtDUAk8Ee888IAtGq1l4pboaZbiiM/hSAE
	S31Q6w==
X-Received: by 2002:a05:620a:4406:b0:949:7058:dbcb with SMTP id af79cd13be357-9498b875510mr84935385a.14.1794857422999;
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94978ae5483sm390417085a.12.2026.11.16.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2PF-0000000AJAU-3HLU;
	Mon, 16 Nov 2026 15:30:21 -0400
Date: Mon, 16 Nov 2026 15:30:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <20261116193021.GB2452510@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
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
In-Reply-To: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>

On Thu, Nov 12, 2026 at 03:53:03PM +0800, Peng Fan (OSS) wrote:
> I used iommu-map for eDMA, but iommu experts rejected it:
> "Using iommu-map to describe synthetic dma_chan_dev devices that the
> kernel creates is the same kind of DT abuse from over here:"
> More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/
> 
> So I followed here [2] as Krzysztof wrote for QCOM VPU:
> "Thanks Jason for context and detailed arguments. Robin did not chime in
> yet, but from what I understood the DT-child-node approach will be the
> way we should go here.
> 
> I accept above point of view and I am fine with this, thus Vishnu and
> Vikash - please go ahead with DT-child-node solution we had some time ago."
> [2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> This series adds per-channel DT child node support to fsl-edma and, as a
> prerequisite, introduces a proper bus for DMA channel devices.

To be fair this is discouraged too, now that I've seen 3-4 people
trying to do exactly the same thing I'm not as positive about the
DT-child-node hack.

Can all of you come up with a proposal that doesn't involve hacking up
DT just to unbundle the SIDs?

Jason
