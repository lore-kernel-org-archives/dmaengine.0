Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703956;
	b=ENMtQRpEBQIUgWWjjsdUELA0dvQQA8dd9LRZqoBTkjZkgfylyAY+WoUZzJOE00pTbd9U
	 RNPr9l0CJ6P6Cc83EkhBKZQ0+t6571Vel/bma/rUfDv+GLsdbihGTijEyfmGhl/QEr6yJ
	 RRRLbMO1V4B9DY0zkeGfUF0ypBk6OqmuTwy/AlqHK5RiXexZgStDyqY3nwEjuJICvzYQR
	 3gkNgY5rrwJ3fu+fHeD6ZE3Dm/+5Rvq3ic2gVOhLJ+7LPzQPC1tgCFjhfKr90JEG+d/Fa
	 RSgDyap5BzW7fzkU6waWyKs7qPulUjx5bE0u7uK+cDMncEDtEEQhMXWmIALjZvVSxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
	b=j1HLSvrKd8XTurHGf4PiKqqaL1+wahLunXF63kNUrBQE+SgeO+0aTg/bzHCqCuVgWu3k
	 k28M1qkftdKA5VadtCxsh2tS+TRRCfQU/KGQzK+RO/zVZIZHpaIHUW3aVs/zmh1CJuOpF
	 /TUxMpc8D2uzI3f1jr6o5byDDjMR4nG1sNXhVKm6r9ex2oGiZU/5UGUSYHMO7+1S9+s8y
	 1t+vN3+gmFUT6Zd+f//i2hMSvbQOzeIkXztONAZwmL+4z7PbuMq4IVR2l3QC728VXFkrh
	 CuNMK1X000mA9eZytyBDCdm8n38z76GNCZLMzdKUSV1jwcMUJyfTpCL5NZ/KwiKCtNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="DxDZK/jy";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B838606A333
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 14:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B838606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DxDZK/jy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so58739505e9.1
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703955; x=1796308755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=DxDZK/jyi9VtiHb0cvgE58g9Zl0do5MkmhZxfg9HKejt3c1xlfARiOTzb7plD1PB4N
         amkbczFI1s1d78cXWITqNkqIm5d8kK0LSLher2MRfjuYpCSUQ0hZRsAOfLh+6XJJrPdS
         RVHW2e6bPkr0P4HwLVdE5v/bmwylFwFMy0mvSggD6kGWaD6jtQf3LbVdfZA/kzMv9r/y
         pBRm1NvnFydhwmd8MZowSVVqGse/OwP9R2OOg9GE2TH/N5UZnlG9w0inDe6z5y73XXWz
         tTU6LbmXcWw6yR8h4ER69y3B9fvsoWBoY8XnMrRAicRb+c7BPiwcl+5RbjYsj54NVRQn
         JH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703955; x=1796308755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpCp8gTUV7b7urT+XT+vwa1wDWyVOE1SIMBZubybyy8=;
        b=NTUNS6MXD4MTvcZ/Nt7hzkxhe1hUmOx6Gbb+DJ3vXD13Z4rO73R0xOstV8kpdDF25y
         nmgKMsVP4XMh8xASuwH/2QuhBuqzgsGW3br+OGrGzu1/+Ud5HaTPhgBjGe9j05awBsBT
         BvXt9cmlDFpYHlpkJuHToPnxJf07INDIV724y5Uyw8xiLCTLQGZK1uarhVCSavoCX7yU
         NwSDqIz6ix24gmzvMEaIVqD8UuL0L2VMasX+nHFpehCUt2l8//iNvx1wcBSiqlSqYZ4v
         XGfkvzPSUJTWtMFk82OZPPBkvWEVBdp1tD03xA2VYIooSX/tYGbW86fmbpPKaDmTBExJ
         S6Ug==
X-Forwarded-Encrypted: i=1; AL+hErGult30sd01NYN0DOKDVKffPXR92sXsamVXu1lXZ1mi8n5mjXWSzGTmJO1zygQtY0PizpLfOgigaaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r31dmGuTHxjsjOEijkI1DZPFRkqh8l5Og7xROzg9tQPxltWdw
	atvxl4pU67w8RlOtPuFF+PYs9hNaWVJJM0XPER7FHYnaGzvIQ7Dt/UCk9xd2GVH7cfA=
X-Gm-Gg: AZFdTZeXQ8e1RVT7LGO4I9v2Mxk5JBKXRpjQIKHO8bs15UFj75eATcv55vLpsMnVVoH
	LFHrxFfPkinzcpgYEABo9uZuxQ4j9fOc35bzE4dWVbfeHju4mOy745rfi9TpbUIoqa7bFaIsLt/
	cwMPmYu4EqGySVACVkpM1daKx1OvuMJv712xb1hbd0jIwFdcujZdIU091X9pR6lEu2c1kpMCF/q
	X8G7XiTNnmFeAJfIzZqy0NcF/18e5PY6/0bc7LYHSq86Tea2P8ACTHq0j78HLLiQE++g53GIqBK
	xxPCmz2dtCN6yP3mb6o1MJpLw+o6eRWyD5XeBym4MMVZUCgz3NEahOeJiC9Y0+JJ8j+m33/f8l+
	bWX5Y2QBzWZxPkC58ymYYbrD+mYvfguGAi6+G9PtY2R9lI6Z43fYwMv8IGqz3bw48i5SmNuP9H2
	41AyZ6geYd9UZ30JdU2bxHUt4M6vAwQV3VsMfsrZ4M3XuB4P82pJT5P0J5b5E9XXS/9B8Qdk8c5
	H8ataYMKyPi9F1MbUviSRziW5isxLaecqOi2uqdEVyYTutiBgBLEHQ7yUr5iaMit/k6pnB4hZN6
	2+sVABE34BIbyO2Lsd46MiQ2wlEa
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr428700785e9.1.1795703954785;
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm712460975e9.11.2026.11.26.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:39:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:43:14 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/28] dmaengine: bcm2835: Support common
 dma-channel-mask
Message-ID: <awhFghuBMy8IzMSs@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-8-andrea.porta@suse.com>
 <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXoAqQhSWa95FH9@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:39 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:45PM +0100, Andrea della Porta wrote:
> > Nowadays there is a generic property for dma-channel-mask in the DMA
> > controller binding. So prefer this one instead of the old vendor specific
> > one. Print a warning in case the old one is used. Btw use the result of
> > of_property_read_u32() as return code in error case.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 51e3a40dbaec..1087157fb242 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -991,12 +991,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
> >  	}
> >
> >  	/* Request DMA channel mask from device tree */
> > -	if (of_property_read_u32(pdev->dev.of_node,
> > -				 "brcm,dma-channel-mask",
> > -				 &chans_available)) {
> > -		dev_err(&pdev->dev, "Failed to get channel mask\n");
> > -		rc = -EINVAL;
> > -		goto err_no_dma;
> > +	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
> > +				  &chans_available);
> > +
> > +	if (rc) {
> > +		/* Try deprecated property */
> > +		if (of_property_read_u32(pdev->dev.of_node,
> > +					 "brcm,dma-channel-mask",
> > +					 &chans_available)) {
> > +			dev_err(&pdev->dev, "Failed to get channel mask\n");
> > +			goto err_no_dma;
> > +		}
> > +
> > +		dev_warn(&pdev->dev, "Please update DT blob\n");
> 
> "Please update DT by replace brcm,dma-channel-mask with dma-channel-mask\n"

Ack.

Cheers,
Andrea

> 
> Frank
> >  	}
> >
> >  	/* get irqs for each channel that we support */
> > --
> > 2.51.0
> >
