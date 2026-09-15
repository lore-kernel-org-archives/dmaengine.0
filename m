Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E76E3D5C06;
	Tue, 15 Sep 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489900; cv=none; b=E15cXSIXs4vSBgCQYzLy6YWqfNf0taMEzc9tP13gv0tERWIfw6A8OIJ9VjMJ/Bc65v9sSB6bjos2H27LwigduK66JtN2wH3GPtXNsoYN2Xf/ZtslurfmY6Z1jh2b1qcclpsfFt2eUjBoDVNhHI9Y+cI2dDRgNSoTj23DHarDXww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489900; c=relaxed/simple;
	bh=+0cduEyXH2KGFJmTyDBVRdGoiV+qXwe0HuNoI8cMLiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p22VhQQ8Yp2Zm6qJSfzn/xPfuoE+ChawCW4KeU1Eum8RUiJuFrgPM+Suw+3aLlloPOtmCHDwv/ObxNlBU6/RrdTeL0TIZHl47hFAd9OdbbY048atIDUQJv68uDDi6JRgxP+YsKvf1bGRJM2BeD7Ry31b8JjINDGxFnhyBGDxgA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKuUv5JX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKuUv5JX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F601F000FF;
	Tue, 15 Sep 2026 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489899;
	bh=Enzn8g/HZrOSxWb7KHXRr6Eiv97dW7+ObyTP33KkoDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QKuUv5JXFko5d+kvImrD26CFerYyB/OJ6rewFa15XIbgh+N7Sz0fhNSw/u9djRMXm
	 phWwuKUDLKXLHrwIci7gDkxbQ8ydzUbDE4HcbxArtL5iPSec6qXf6W4dXQ/+jXM1WY
	 aUhTCJHKAQMo8vv9be/8KZsxCLK40Twy90kA/8xz12orkTD22m21xmc5ka30tEYw0k
	 vHccPrrKCRrKuAHF+0bVJMkCB3jC1wSPbJ2+WWVOjhjn2ybJC1BVyQbLkg8f24qOgR
	 x/QwaO5a/xISLP8CtIQV/Cun2xjw2OnV8f0OHuOEJfQ2nztIR0VmCQx1ui0RP9Ue4g
	 qReQHcHaZX+4A==
Date: Tue, 15 Sep 2026 22:01:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Message-ID: <aqly5hAYHhmxKSWA@parshuram>
References: <20260910200637.41512-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910200637.41512-1-rosenp@gmail.com>

On 10-09-26, 13:06, Rosen Penev wrote:
> fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
> unconditionally increments total_chans. When a channel fails to probe
> (for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
> total_chans still advances, so fsl_re_remove_chan() later dereferences the
> NULL pointer during device removal.
> 
> Check return value and only count successfully probed channels, and guard
> fsl_re_remove() against NULL entries.
> 
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v4: use break;
>  v3: fix sashiko review
>  v2: fix description
>  drivers/dma/fsl_raid.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 9cc289f7129e..6167fa652e96 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -836,18 +836,32 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		}
>  		/* Find out the Job Rings present under each JQ */
>  		for_each_child_of_node(np, child) {
> +			if (ridx >= FSL_RE_MAX_CHANS) {
> +				dev_warn(dev,
> +					"too many job rings, max %d\n",
> +					FSL_RE_MAX_CHANS);

what is wrong with:

                                dev_warn(dev, too many job rings, max %d\n", FSL_RE_MAX_CHANS);

exceeds 80chars but makes reading less painful!


> +				of_node_put(child);
> +				break;
> +			}
> +
>  			rc = of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
> +			if (!rc)
> +				continue;
> +
> +			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev,
> +					"job ring %d probe failed: %d\n",
> +					ridx, rc);

here as well

> +				continue;
>  			}
> +			ridx++;
> +			re_priv->total_chans++;
>  		}
>  	}
>  
> -	dma_async_device_register(dma_dev);
> -
> -	return 0;
> +	return dma_async_device_register(dma_dev);
>  }
>  
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> @@ -872,7 +886,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
>  
>  	/* Cleanup chan related memory areas */
>  	for (i = 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);
>  
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);
> -- 
> 2.55.0

-- 
~Vinod
