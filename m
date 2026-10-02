Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF332486BB4;
	Fri,  2 Oct 2026 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942463; cv=none; b=oTYUJe9uxwjeh68WXtHEq05q6cS3a+totxLjtGG9igPNNCzqHEZs0hstFnTwwiygx/TBKT/8GtBHv0GfemmDp6z4kYwBbzCSQ4aQAo+hco0vBkN9kXm2uOVq4u2UQKZeAnNAWy5pnJvU1AiaYFgh7nR6LV0fBSF56D2JHQQwPrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942463; c=relaxed/simple;
	bh=wjGPhqLdUPxxQ8hIdNzWUdbwHRjhhPUYdhvazM+TiDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9DT3XvkNqyRO1dnRM6saPfTli0yi5mtMRTwKk1K4pldL+oGG+4T6rqeeSeLfNryaeLNwSKY1Oip+CKJD6+WPDnACco2+92PKDzg1Fksc524Ylziq7Hwa3dICfu6vz3+8R2nwRwHgOx+k79Oi48lKX2rs9dqgO9mOclSbGT4Lp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BLIZfEcu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BLIZfEcu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 455CE4E41103;
	Fri,  2 Oct 2026 12:00:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B0B7603DC;
	Fri,  2 Oct 2026 12:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D33A103281A3;
	Fri,  2 Oct 2026 14:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790942458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wjGPhqLdUPxxQ8hIdNzWUdbwHRjhhPUYdhvazM+TiDo=;
	b=BLIZfEcutQU/GVJn9Dtb03DTsEgXgs2oB0BKbhdk326jknpP0um6jVD996YrNgILNReWsP
	PjEVC7wW1bJpUvy1AsZ7a2pNkexynJuzHv9wSk5XDbVOuDhn/vaf56VPFAhNtMfTjSqoqE
	QWPKm3332KzK24j4g5V3RdOFl2ps3qYLfli8k4OkjiRGFtSyCv+BSsWoyLOjNBMQ0QdVOT
	+Z8cU88cHPdFczaSsZjPou63XXcVr41wtJZqiRqbNhCEkVaQ74yl8sJTDPZPBa/8oZCXbN
	RQuyKBzK7gyinIh1jPjEgr24WZrazlL4at5t3Pg8/tZVLIGNiMoxo6maxNrQlA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] dmaengine: fsl-edma: Scatter/gather improvements
Date: Fri, 02 Oct 2026 14:00:56 +0200
Message-ID: <bsv-R2foRp-2e8IxUjsoMQ@bootlin.com>
In-Reply-To: <20260916-fsl-edma-dyn-sg-v11-0-02792de71b92@bootlin.com>
References: <20260916-fsl-edma-dyn-sg-v11-0-02792de71b92@bootlin.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank, Vinod,

> This series adds support for scatter/gather DMA transfers via dma_vec
> and dynamic descriptor chaining to the Freescale eDMA controller driver.
>=20
> The first patch implements the .device_prep_peripheral_dma_vec() callback,
> enabling the DMA engine to accept an array of dma_vec structures. This
> callback supports both regular and cyclic transfer modes.
>=20
> The second patch introduces dynamic scatter/gather chaining, which allows
> multiple DMA descriptors to be linked together without stopping the chann=
el.
> This optimization eliminates idle periods when back-to-back transfers are
> submitted, improving throughput and reducing latency. The implementation
> carefully preserves cyclic transfer semantics and respects hardware
> constraints on platforms with split register layouts.
>=20
> I tested it on the i.MX93. The dynamic scatter/gather chaining should
> work with other eDMA controller with split register layout.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Gentle ping on this series. Is there anything else you would like me to
address?

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



