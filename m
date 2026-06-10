Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2159F23392C
	for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075615; cv=none; b=A4HrpAhZzXoYtvEq5iUcOJoQXP3wDHxOd8zBhHSYZFE+icTYdC+17ET2LLf56uuy92VqSQeIwg00pTIeZS9MyjdIjrEIp29NCa+XEcIRDd3BbcNFblUxrPWwdW8NYLq2LCn9eXtBGOofuP2LeHfrfn1Gwp95qv9kOffKnzYRgk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075615; c=relaxed/simple;
	bh=LnQ2y+rkKaAEMwZ9tQr/5SGBGcmlRLJsaYp2fv2OlPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+EMrjL0wMLj0pO1TQkSeEEE3MJUGKnqsPNRiX1cDTBFwBPlu9vQvfydF75vrcNOQBuBYZIqn+xBKTdS1ceMncq3BVYNY/AyW8TX+VH1vKYc49IM/jwk9uMjp5hEj4coFPgcyvoxFcaoXvMkiMqk4gGUiS7AseKl1DnpeoRbNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T83sdm0m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T83sdm0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9119F1F00893;
	Wed, 10 Jun 2026 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781075613;
	bh=fUAWyrRMGaogRKyD8+gXn77puZd3x3dkAjvHPIYJXTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T83sdm0mpjSQ54ROAExmdqJwELNu9PF7uLnoJFLmvN96AE41SIYxf80PssiIbEe5T
	 8is7pOgwV7eoJjV6fxu3PY2ySYBfCU7PEjNUyaj3ydlCu4iaDNLXOFbha4vF7Ozwp1
	 hJvozGnzsu419eM69Q1/Fgjj5+lsALBaeg+C/GG9lSMBdIuoCSxCeSoXEWOtnGY3UJ
	 DCOW1z6vstO455gAzreY5asegNMc+6H/zCN7ZqAOjJC0q+lYdjK2vlKgfSiawlWpZu
	 KA/pFgYnZXPneWl6LaJcD8GYDrZARAdc5P9JMHvhfnU4TzwHs8Q4WHiFsChV6LQ6bb
	 p1658Fqz872bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dma: mv_xor: use devm_clk_get_optional_enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260610065737.118211-2-rosenp@gmail.com>
References: <20260610065737.118211-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 07:13:33 +0000
Message-Id: <20260610071333.9119F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ tasklet `mv_chan->irq_tasklet` is never canceled, leading =
to a Use-After-Free.
--

commit afdff052af38a51a1e801381a05797da055168c9
Author: Rosen Penev <rosenp@gmail.com>

dma: mv_xor: use devm_clk_get_optional_enabled

Replace clk_get + clk_prepare_enable + clk_put with
devm_clk_get_optional_enabled. This eliminates the need for
manual clock cleanup in the probe error path.

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
[ ... ]
> @@ -1452,11 +1449,6 @@ static int mv_xor_probe(struct platform_device *pd=
ev)
>  				irq_dispose_mapping(xordev->channels[i]->irq);
>  		}
> =20
> -	if (!IS_ERR(xordev->clk)) {
> -		clk_disable_unprepare(xordev->clk);
> -		clk_put(xordev->clk);
> -	}
> -

[Severity: High]
This is a pre-existing issue, but does mv_xor_channel_remove() leave a
tasklet pending when called from this probe error path?

If the probe fails and jumps to err_channel_add, the cleanup loop calls
mv_xor_channel_remove() which tears down the channel:

drivers/dma/mv_xor.c:mv_xor_channel_remove() {
        dma_async_device_unregister(&mv_chan->dmadev);
        dma_unmap_single(...)
        dma_unmap_single(...)
        ...
        return 0;
}

However, it doesn't appear to call tasklet_kill() to cancel
mv_chan->irq_tasklet.

Since mv_chan is allocated with devres, returning from the probe error path
will automatically free the channel structure. If an interrupt fires and
schedules the tasklet during teardown, could it execute asynchronously after
devres has freed mv_chan, resulting in a use-after-free?

>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610065737.1182=
11-1-rosenp@gmail.com?part=3D1
