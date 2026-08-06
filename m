Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D48243956
	for <dmaengine@vger.kernel.org>; Thu,  6 Aug 2026 12:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020109; cv=none; b=DM3ZixAgOcgiFRsjrxmPA8gZHTc4BR2ziSsXfmkPOqsiMJPnNIYw8dVuwSZOIkps1oMK4yW0CqEx0oa/7dhCrGa35/WvPIE/O7evWFEYeMDgK1dkbBnUGIufDStXem0mFRtMhqpAQJ65s4mCC+h68d1IuA1bcmLcWTFSNNdPFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020109; c=relaxed/simple;
	bh=hzfogGxFmfk/wBXhyuty3dKqFblapD3F8QOt4SuPhoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hFJObLB1Tbyt4uZ1mrqyU/tppM4AQXTWxMfIz0iO+RdwZC7DIGXGefU7bS+/WseOszVuiJG5WO9Uq0lDdNcuzEIozOnBsBuWIE6dGle5bnLA0irzywZVQgKB+7Dn6YzrbOUtyLayTy0l6J6f20ur4x2u3pi9V58xG6WqVF94gYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQNAcPj4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQNAcPj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543351F00A3A;
	Thu,  6 Aug 2026 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020107;
	bh=8zLP0rA0GjTv63uhku8cqShzvZ5apXdulNBKJqf4V2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQNAcPj4ipao3E/c+mFWcr03bx6I28nwW8GSWubhJZpIEb5EEoYkvg2/Y5j7Yao10
	 uWDmTXY1zUoNPeEXUNdYDRW5b/S97QRs/b2osA+Ph8e3efkk4NFwDibQ0jkYtywr0T
	 uAZSpejRu+at+tkgi2dmkTFoE5HbbQiE3nz9mZixjMloWOckQCHnNKWMCtnGklAfUi
	 LuSl1wzy6g97xfKqzAx6hex1zaVGpaXtal/k5mjGDz0NTBwCnL7UCpwXMZWcwlYof6
	 KtjCZiV5QzHYSD7h4KCwX5hD7Zb2zK3+GGHITWvDp60pHYHRFPaf5+0wScwzTTSSbo
	 eXK6M5mOUqhyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] dmaengine: zynqmp_dma: Fix minor whitespace
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260806123014.2120447-5-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-5-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:41:46 +0000
Message-Id: <20260806124147.543351F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PM runtime usage counter and hardware clocks leak in `zynqmp_dma_p=
robe` error path.
--

--- Patch [4]: [PATCH 4/6] dmaengine: zynqmp_dma: Fix minor whitespace ---
commit 990948221cda48a26b5380f5bdf1dcf6dfa5ba05
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Fix minor whitespace

This commit fixes minor whitespace formatting in zynqmp_dma_chan_probe().

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c

[ ... ]

> @@ -959,6 +959,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_de=
vice *zdev,
> =20
>  	dma_cookie_init(&chan->common);
>  	chan->common.device =3D &zdev->common;
> +
>  	zynqmp_dma_init(chan);
>  	ret =3D platform_get_irq(pdev, 0);
>  	if (ret < 0)

[Severity: High]
This isn't a bug introduced by this patch, but if platform_get_irq() fails
here and returns an error like -EPROBE_DEFER, does the caller leak the PM
runtime usage count and hardware clocks?

Looking at the caller zynqmp_dma_probe(), the error path seems to miss
dropping the usage count (e.g., via pm_runtime_put_noidle() or
pm_runtime_put_sync()):

zynqmp_dma_probe() {
        ...
        ret =3D zynqmp_dma_chan_probe(zdev, pdev);
        if (ret)
                goto err_disable_pm;
        ...
err_disable_pm:
        if (!pm_runtime_enabled(zdev->dev))
                zynqmp_dma_runtime_suspend(zdev->dev);
        pm_runtime_disable(zdev->dev);
        return ret;
}

Since probe deferral is a common event during system boot, could repeated
deferrals continually leak the PM usage count and permanently leave the DMA
hardware clocks enabled, preventing the device from being runtime suspended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806123014.2120=
447-1-nagendra.golla@amd.com?part=3D4
