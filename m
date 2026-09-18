Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8770B3264CE;
	Fri, 18 Sep 2026 06:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712269; cv=none; b=mFWjYUBVRPeRMtDKnIwI5ZPcEVCl7D3Do9zzcCa/U3L3QYnwhp64mFACtx07owOLQOYlK7iR2/MsaSFuuzF2PUDk6H3DagzAlyUG6fX1BsaybjhYljg1jvUVDI1Q3eZx9Qaw5bYRVjQuuAgn3y01Z1NBG8cI+FPw2jX0JKsd9bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712269; c=relaxed/simple;
	bh=LNIh1q/fCx/y46pBI0Sid4N/SRWMnARsEQ1jgoXlDXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxAjY/b8/Mhp69B+LoeZxFTeKg/LNPRmuu/AzIVLAG5zfkO3dNqRRYlddEnmjLFVMHhzde1tU8K/iaIWSil3RcFpWxXGDvHUDU7BlH5t6t6GxOHsnbGyvMrTRTfSDJ8jWTT2HoL2T+6VZE9AuZjU7sH62PMtT81/biYdvKuUwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIymmGnM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIymmGnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5304B1F000FF;
	Fri, 18 Sep 2026 06:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789712268;
	bh=ZQuk43Brm3omuO2DAekLSRMmNspb8q1ZaXTTwle8fh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VIymmGnMspsP0ZCZVY4PL6IoQsRGqoVMe6G9hD5c4ysDDmi8QeeDmXQPdZK8eTdyB
	 qgUXYXI82Snvu3l6r6Xrd3IT1Cm+FUDt2b3R2efOqoj5cvn1ULdyBhzwLSge4tTgWb
	 dZJXHHmNdObQOFAEvE3k6+JsVfbUMPfK7NWXSTvjTJcyhjNRJ+jdAmY3ESeAw8HJOM
	 9gdxrG0r+FrCVnE/y/dcTbbslcYQYtVRzQDU3icXkC11B5bUy2UEnZ32sY1AxsBFya
	 oMeawWzq4mHGu7JgLPbIbAvD/hpyDXAW0Yz2eJ1+AXHlmwucCuieuZETAFHd5ZFpoD
	 VXDSDi/WgJ8wg==
Message-ID: <5b086e1a-8b8c-4536-8b64-e0169826ab33@kernel.org>
Date: Fri, 18 Sep 2026 08:17:44 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] dmaengine: bestcomm: use platform machinery to get irq
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
References: <20260918001835.154305-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260918001835.154305-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 18/09/2026 à 02:18, Rosen Penev a écrit :
> platform_get_irq() avoids having to explicitly map and dispose of an irq
> by having the platform_device machinery take care of it.
> 
> This requires replacing the device_node with a platform_device in the
> bcom_eng struct so that platform_get_irq() can use it.
> 
> Conveniently, this also allows getting rid of of_node_get and
> of_node_put as the platform_device machinery also handles that.
> 
> Adjust the goto labels in bcom_task_alloc to match what is being freed.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v3: drop stale description
>   v2: resend
>   drivers/dma/bestcomm/bestcomm.c            | 47 ++++++++--------------
>   include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
>   2 files changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index 241a91936fe8..1006030ff167 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -99,17 +102,12 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
>   
>   	return tsk;
>   
> -error:
> -	if (tsk) {
> -		if (tsk->irq)
> -			irq_dispose_mapping(tsk->irq);
> -		bcom_sram_free(tsk->bd);
> -		kfree(tsk->cookie);
> -		kfree(tsk);
> -	}
> -
> +err3:
> +	kfree(tsk->cookie);
> +err2:
> +	kfree(tsk);
> +err1:
>   	bcom_eng->tdt[tasknum].stop = 0;
> -

This blank line removal is unnecessary.

>   	return NULL;
>   }
>   EXPORT_SYMBOL_GPL(bcom_task_alloc);
