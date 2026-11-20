Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195972;
	b=eRw0IdGIuh5SUTJTERDX6ThprbRJXR37sE7M3ia/SE9K8YPeaUXqZPLJ2r7Kc4HVhctL
	 uW+DzUT8l5XWy5/n0vmxIAAqeiNyk6yteHmBbMLmQOoEWUlf+jSHmo0W4KGs/IgOcqDNx
	 BfS9qRCJpOkEZJQOxVQBl33NuXLhQSIeoxDB2uYHhGmX2Nt35QrN0rFO9yNqCey5WGsCo
	 PuZGep6t11NQnzwHcwD/5JQdxz8EPWtsgIVqvhXhpGTNFhNxQ97AkbvtwcOIx0kGehBzl
	 nustZQv69/uL5pSek5NQOYLnpW6y1moZ3kFQIk0uuhWgUKY6F4BJId/Bj0L8vliEqsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195972;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n8tTJYNVmvDSnD7/iWpFjS2nOLJMHJfdhJ/kBsqbuS4=;
	b=WFZWd5JxrekraByhq6qz62TzoPswC3/LqPVHO34vsviQ/6z/qUZoKeufSuUon78MMOAV
	 U3Gh/qrgx+ptId/W7iU3K8uAvmLjjwgNoWzx/9iS4ovnkNFQUFUVlx/xOmrPsH3cX2Kii
	 0YuoiRHQlqk/rFn2oUXe3yQYCGpgJySBHM6SkuRh0UucTKjnyW1GP14rNJ1bFUywKbpum
	 8RWTjYkWys3j6HYJjawUQaAJbkVOkHR3NoHRJoGCshmld/yqJNSWg8nE6Hh5IcUeWtsxB
	 fbES5Q2UUdhwwsfdRoLE0vjxs8uLKORgVIBBmp1gdNTu7XUHAOhU3jf0xShzbNSa0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/qJMmjB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F55A606A333
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 17:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/qJMmjB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0F31F000CA;
	Fri, 20 Nov 2026 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195971;
	bh=n8tTJYNVmvDSnD7/iWpFjS2nOLJMHJfdhJ/kBsqbuS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/qJMmjBjdse1VRg64Fa2ctIwCw7WYFsJs19zKyczGhaPlxA/kXsXK7Cbd5EWapcD
	 BVTrrYx+qWXoVMRVE5H9V8Z6fyGME1FB6ho6fKHGqhDLgMnHwbTXyt9r6gkocQj8WZ
	 Nv0wK8jhKMRzKtVZ3PwC7BhEBIVC4Ewe/DxGCySKxXAvDaLf2cxudU30oHIODeU59m
	 JPx38hDpBat9vxu3f19C/FooAl/jssv/bXTA5sAWWRV3HQbl8wHeibsA6/HPYDleFc
	 CQKFeO7QnOBYdjopnogWMHcjRr+UdAXs1dn4cgwdbjZNV2pkYIxh5KIS+dPvIRcDEw
	 FFk+6IHxPv94w==
Message-ID: <sashiko-outbox-225678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: tumic@gpxsee.org
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120172356.5858-2-tumic@gpxsee.org>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:32:51 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: xilinx: xdma: excess @xdev kernel-doc on
  xdma_reconfig_channels()
--

commit a64f0416a1ecd1d433bba480228119fa8fc96611
Author: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>

dmaengine: xilinx: xdma: Fix broken PM suspend/resume

This commit adds noireq PM suspend and resume callbacks to save interrupt
masks and reconfigure the XDMA channels and interrupt registers across
suspend and resume.

> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 9d827c9a12674..d6772b38d8f7c 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c

[ ... ]

> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>  			    CHAN_CTRL_RUN_STOP);
>  }
> =20
> +/**
> + * xdma_reconfig_channels - Reconfigure DMA channels
> + * @xdev: DMA device pointer
> + * @chans: channels configuration
> + * @chan_num: number of channels
> + */
> +static int xdma_reconfig_channels(struct xdma_chan *chans,
> +				  u32 chan_num)

[Severity: Low]
The kernel-doc comment for xdma_reconfig_channels() documents @xdev, which
is not a parameter of the function and causes a kernel-doc warning with
W=3D1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120172356.5858=
-1-tumic@gpxsee.org?part=3D1
