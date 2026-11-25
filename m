Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620331;
	b=qq6YPVzONOMDLMYrK3mgEO70J0dxchttC00n0a6J78/jewUxgRmZoHhDaCASYPoymTVv
	 rpjMFndockFMy3R5InJBjY+J7ahdsZlpsNPzNoyedTJU02El4M+P4an8ym7cZfXLIdulR
	 sa1iGqSCRhj6ZuAcWh4Mscm4v/jI/+4qP/Lhmo20ROujh9CwcNsFDje3ygty04Xuw6lt+
	 pzAzegDy8vEc2CgfM2pkQiIcXFJE5Iki04PUTPCJAiIZkI4nP3oMBk3r12V25qsTXYub9
	 XNeT8j+DNevBTEp61/SfR3lGaDB/UWQg3liAHfEBxqZfk1pZT/1uqlYVMsCuImvYTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
	b=5ZIhMlsn3bPBfb1g0vjJCVnJ4pUKTmV4sr+C9gssmVCkLRBA+99xSblV2+bIRAndWEsJ
	 MyW20olq2JDk4ZBo5iMs81xUpWyNpoD+4AMqfBuCNliqHSn8LH09YaTK0pBeJWUXd5Dfu
	 1jZXIhAg3pw6xFKcIxJNEU4okK7eC/VuhsMkKV6oE5+QmzQDFDR+Hm/XijRpaDNF7N806
	 dHZXpYmZ9UKToOcAurA1FqAOl+DHTDRHpAzuYqrAR8RAsMSo00MQEtfaG6zXBZcQJeflB
	 fz2bQWJl8jhdiz+3/Sa/gEGDPi6aF7veg07vj0sCdDujmheZa1Jd/xhgaONtNTl7R4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq;
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C389606A327
	for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 15:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C389606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7d2da166818so3529559137.0
        for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795620330; x=1796225130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=iFk419BqbfBi/6ObNDUZ2vsXpKfzRGG8soL1vwWsfo3s0278JXjr9iY8LX249svZsi
         r6zCWgQOJswtMqBkGndgaQ0IvnnCAjGp65TR4XQNdfZ5sZPg0BgeutzGHAq8cM2f0LQv
         k79Pa3Mi31cvvRuTHw0jZ0595qcyP7Hk6uoobP2Z5yd2mn/yT4hXNKxz8+kfBrSxNLDf
         QHFAAQ74iOvDW0Lv4NLZloAJyTvOPgRcIasINF2MuVmMIVyHVBduWP93wMPTk4SQT8Wq
         iiMNt8SR9mbCr9h27gdplCbxaAkt1KGPe3OqaB/mp7PDl4S4WFrxi6Ipq3bM+f7oWh6E
         wrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620330; x=1796225130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=D6x4WKuweSgw9l7KqhilZPUxQENo36BsYloTOecocwjKfTDAut7TsqNirW3pxnpGVm
         ZiOei6D5E72xCvHCCaYR9r/+e6jNMMOug9JPbo/Lt9O/wrRgg3gv4dMTBhXm0WmcwnNS
         sUEOtNAe17uOPylWeADRxs59ws1OO+kOKfWWcwws3dZBlAA4nnHEmnKaYhVF7h9f4sjW
         VyOEafQ1zyMb58Ujf4ifnbrq3zZwa6ayjVqGgHyM5I6SnU7oIt5UrUSTLLiwmmZKa1Bp
         WPPp6rgsIg1SbM6Kgxw6gUcb3EGqbtGKrg5roEgpzQe5wYxhkaZTRtSJW3TrzLMeSy1y
         yfBA==
X-Forwarded-Encrypted: i=1; AL+hErEFTfJ/eu/LhODeJONMr7E5VB1crncBspqMcCJ/jZWR0BUhDdAep/zIaZ6ynBW5ntohfONzCm+ygws=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7IbnCzdQAz71JPG7J4CKUPx18t0WJyslQnmtW+JrLd1+2XXDP
	IKv7rrNWujqmLuxNl/RdEF/IR4xPjz1PUtaYwOmm7dL6QFssA+goNmW+g4V7y/taFL8=
X-Gm-Gg: AZFdTZcLe4gekcTj4h9NtWJGN+0sG5qm0DRz93aS1+NrqOOS16xoOec8u/vzvhhJhQa
	p3d6zrDZbyet+l3CvVJ1CcsZCFgNjTxETUEvy1UtG2WJ+hOvuiBaqbAhWAm+1Quyvgz0Wt+FYVU
	BcNNYMImhL3ZPBfZE4jxSiB4kZao7Q7Jc0VHTibOPNOGsJbLwT14uc6+NVrbLMrOcJTKmioFCvo
	DqUH3srfXL6qcMcNAPntkZBlKmDlJCurlVRjpAZx+uyusHHlDHzD1EryEJycSMbDgg6gJOEJ8Yh
	HS0x6PS7Se0sL/RiUQcshN/VrwbZtnCOlTFz/vQV0A8Rb0Ts9TnZUem7c3PFbhF5xeYtYQUuuuQ
	dkNny54Yc+otvQuzJU3DoZFdOubhQJLgSXIchntZFn+5e182TddcC+S2fQ2DPIi/BD/aexCX9DO
	8j8C2nKXgkmQyO6f+AViInsdVPLUJfXhmJ8aRInLexyN342TKHgyFSUPZKwoHBUjUQUiCoIBry6
	5CH13rDkWmUnH1w00XTDkhA6tjnCpJxadvDlj7NYcF0XJNzi10qL2f+79dCNjlPEjg937enQnmM
	SCOUZOyUC0P8gNEvJbjbPFgKvgk=
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id ada2fe7eead31-7d739572406mr10710273137.20.1795620330327;
        Wed, 25 Nov 2026 07:25:30 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm165007476d6.4.2026.11.25.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:25:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEsD-00000001rUc-0W0U;
	Wed, 25 Nov 2026 11:25:29 -0400
Date: Wed, 25 Nov 2026 11:25:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
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
Message-ID: <20261125152529.GK246011@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <awGWcq_nKWShC81B@fedora>
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
In-Reply-To: <awGWcq_nKWShC81B@fedora>

On Sat, Nov 21, 2026 at 09:02:42PM +0800, Peng Fan wrote:

> Do you think it is reasonable to have chan device(not platform device) do dma
> allocation? 

?

Any struct device that works with the DMA API should be able to do
memory allocation consistent with its DMA parameters. That's an
integral part of having a working DMA API.

If you are asking if a struct device that can't do DMA should be able
to do DMA allocation, then no, obviously it should not be able to do
that.

AFAIK the main issue in most of these cases is the need to get a DMA
capable struct device for a particular SID because of a confluence of
decisions the HW designer has made and the Linux limitation of struct
device baaed DMA.

> I ask because if we allow chan device to do dma allocation, we need
> to provide a dma channel bus for iommu_buses to fix tegre186(TBH, I
> am not familar with this platform, it even has iommu-map for the dma node).

If your question is 'should I be able to have a "board file" that
creates DMA capable struct devices from C code" then I think that is a
pretty "smells bad" solution. Especially if you have to then create
fake busses and add them to iommu discovery.

The DT should create the iommu devices as platform devices.

There was yet another thread about this, so we are at like 5 drivers
now with this kind of need? This was my suggestion on what an API
could look like to solve this general problem:

https://lore.kernel.org/r/20261119143151.GH3115493@ziepe.ca

I recognize it would not be so easy to make, but it would be easier
and safer to use.

Jason
