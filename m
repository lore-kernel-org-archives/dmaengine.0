Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AE3B9D9E;
	Mon, 10 Aug 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357696; cv=none; b=XYrTWNI9tp7ZbunqjvqHmP9oy94NJBplDPgVL9sNaTOYtqDdMGwA3xWbNwim5J8AWc3sOoBSyaZ6Hx+54OXIGNWqvu9d+N1GOtCthLOClZKSs0fOfsIro34fbNUmbRzc+MD9YUShtAxwOXW73YjWizvclS39WGvH9Wtxl2IWsHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357696; c=relaxed/simple;
	bh=MEgxvsVicOqUKKR5UUXnSNBC87ROXUg6AB4ofv41IJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QYv5pE3WNtK/zYdsY4W34f4v/67cNDq+deSQDNaVWf+Vc3Di9exjTaE8wEg8QADkA2VIwPfZsFAXVZzyO03aE4KwHL5agOz8fJR+sXU6abORHqvKwiQcXSuc58YWkbL19rbJzh65GDyWtSHqXpVhKGBlX//DfNn3Dc+gs6Wuyr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwLwwcDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwLwwcDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6981F000E9;
	Mon, 10 Aug 2026 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357694;
	bh=KOezl1dvLhz0ffpzmNZXd/K0gBC47EJkeM1niLwGGo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fwLwwcDCkm/moS0cb7G2mo/9bschaPrtsm0P3HmOEYf/HINaXosp7P/qmPdct2tSo
	 ZuSTtEvOsEgDhi1lzZReRX/Phx5H2yvvGSust7/a1prBc0SPjtTN/dA+YGwO87jod6
	 hx1Q7m/9HRrIGmIQNzzRVDOTGPHkKYHnb87aNbH0Wvi99sL5lWLWsF5LKKFEc5D+Oi
	 ITz8HDjHMrF1mOuLML/t2cJ/n/BuV7ZDmaY7atC1DEXXUU3a7tglMEhZUhxUa1vVXT
	 KiBLeP1SRcJJmCEpNUXs+ueQ41vP6VaL7bKzD1hpD4tagzTZ5erDxLYvD4gJQn2xlP
	 VvGdnS31M8Cdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 1/6] dmaengine: zynqmp_dma: Fix PM usage count
 handling in probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810100452.426320-2-nagendra.golla@amd.com>
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-2-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 10:28:13 +0000
Message-Id: <20260810102814.4A6981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The introduced pm_runtime_put_sync() fails to synchronously susp=
end the device because autosuspend is enabled, leaving clocks active.
--

--- Patch [1]: [PATCH V3 1/6] dmaengine: zynqmp_dma: Fix PM usage count han=
dling in probe error path ---
commit 8bb5754b8f17c08d0144740ac308428274806a68
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Fix PM usage count handling in probe error path

This commit attempts to fix a reference leak on the probe error path. When
probe fails after successfully waking up the device, it adds a missing
runtime PM put call to drop the usage count and allow the device to suspend.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c

[ ... ]

> @@ -1152,6 +1152,8 @@ static int zynqmp_dma_probe(struct platform_device =
*pdev)
>  err_disable_pm:
>  	if (!pm_runtime_enabled(zdev->dev))
>  		zynqmp_dma_runtime_suspend(zdev->dev);
> +	else
> +		pm_runtime_put_sync(zdev->dev);
>  	pm_runtime_disable(zdev->dev);

[Severity: Medium]
Does this actually suspend the device and disable the clocks?

Since autosuspend is enabled for this device earlier in zynqmp_dma_probe():
pm_runtime_use_autosuspend(zdev->dev);

Calling pm_runtime_put_sync() will only schedule an asynchronous suspend
timer. The immediately following pm_runtime_disable() will cancel this
pending timer before the suspend callback ever runs, leaving the clocks
permanently enabled.

Should this use pm_runtime_put_sync_suspend() instead to force a synchronous
suspend and bypass the autosuspend delay before disabling runtime PM?

>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810100452.4263=
20-1-nagendra.golla@amd.com?part=3D1
