Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD1CCA6F
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386562; cv=none; b=hUHBt69yjemAoWxvbrsDMkCG8bom0iSDk7qZ3If7K+kyNmsRA+dbUnVSUi0mhV1/WH9O8+iIj/shPCP4PX8XFye0QyBS5W3Wrvtf0yGJaYbbl1wzZMDWdh2RLHuYXEc3nC32XLlPTSRbU+C1XrR/ruTIKO2KCte/rlk2c1lLqXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386562; c=relaxed/simple;
	bh=1eyaksgtsUp1zxBBIjkHnU780EbFxZGaZaSmWDtfrAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u+vFHASteNXS5szzhIXXJRof3KtYb4cdxfnDt5n3Xs0RifgsfWVdFR9jur04u0LH30sHAnMW76n1KhoWl1P67OdEsFsWe8hFjy0c21Tiv9w6uc/cYgxPd8aw2UwsOVC3jL22ZNjTXd0vc8jBJ3pa6CqEp8Ei/rXZgB+06emoZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqcmitSa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqcmitSa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27BB1F000E9;
	Mon, 10 Aug 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386561;
	bh=4YTb44XmwyBkeDPWujSm+gPNlSdqN/tqxgV/97HV0cc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jqcmitSaQS0+voQ3xmx9LPreinC9426bQABVg/9f31/LfKmGcrBmAFmcLic8BxBy2
	 KVTYSqKGDmJhsQmMU/0S3w+WR/XPO4kV+wB7CZjgei7NhVzlCQ/jPvwaQM447lynhi
	 P55vHOnUqiAbyqPdYeXDwd/YznA/M/PNx0/73xddbkMne6AlG2nxr9+2iaArFX+I1f
	 g/sdpYn9/h9Qt6HZI/R63uH/bnQzcZs0Ct1gCsknsg2rCWzH0MrV6S8sXuNsxSSTkG
	 emh3fNbgs1lQrszy8ZGQX1wD5gPE0M9OKtrbdOsJtkTIk0+g4YVi3AyoVERnc3yt5u
	 z5qWzgsCYHrTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/34] dmaengine: apple-admac: use dmaengine BH
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <cc5172b8779e4cd15f2c1c7fa93174aaf09dbffd.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <cc5172b8779e4cd15f2c1c7fa93174aaf09dbffd.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:29:20 +0000
Message-Id: <20260810182920.C27BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of the bottom half (BH) work in the driver's =
remove path (`admac_remove`) can lead to Use-After-Free if the driver is un=
bound via sysfs while channels are in use.
--

--- Patch [3]: [PATCH v3 03/34] dmaengine: apple-admac: use dmaengine BH ca=
llback ---
commit 6eb12029fd22d727d6a26b7c59c7dfc98c07ffa3
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: apple-admac: use dmaengine BH callback

This patch replaces the per-channel tasklet with the shared dmaengine BH
helper. The handler continues to run in softirq context while dmaengine
owns the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a4815..c5d4fb96d3c4e 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c

[ ... ]

> @@ -886,7 +882,7 @@ static int admac_probe(struct platform_device *pdev)
>  		INIT_LIST_HEAD(&adchan->issued);
>  		INIT_LIST_HEAD(&adchan->to_free);
>  		list_add_tail(&adchan->chan.device_node, &dma->channels);
> -		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
> +		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
>  	}
> =20
>  	err =3D reset_control_reset(ad->rstc);

[Severity: High]
This is a pre-existing issue, but should the teardown path in admac_remove()
explicitly terminate active hardware channels and flush the asynchronous wo=
rk
items?

If the driver is unbound via sysfs while channels are in use, admac_remove()
returns without stopping the hardware or killing the BH work:

drivers/dma/apple-admac.c:admac_remove() {
	struct admac_data *ad =3D platform_get_drvdata(pdev);

	of_dma_controller_free(pdev->dev.of_node);
	dma_async_device_unregister(&ad->dma);
	free_irq(ad->irq, ad);
	reset_control_rearm(ad->rstc);
}

The devres framework then automatically frees the admac_data memory which
contains the bh_work struct.

If an interrupt fires immediately before free_irq(), it will schedule the BH
work item via dmaengine_schedule_bh(). The workqueue would then execute
admac_chan_bh() after the memory has been freed, potentially leading to a
use-after-free.

Could a loop be added to call dmaengine_kill_bh() for each channel in
admac_remove() before letting devres free the memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D3
