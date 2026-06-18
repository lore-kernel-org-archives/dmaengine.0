Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8842BB17;
	Thu, 18 Jun 2026 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767368; cv=none; b=bm4CXAmhXdA/HfzYl2UbFpaYOmIdz7Lin6IfCyIFSqcDwYowLL7bgLbGmQ6Xp0Q5wvAgFjhNIxH06xi9OswSR/ezUfi44n/hZOEgJoLyojaDXGvTi282Uim3bSiejMJQCzg+SQWirHnyWNNsm+QdhfF87QVbb6PpSm6UIxP6hXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767368; c=relaxed/simple;
	bh=BWAmPdJS8zm2N3lN0sNlSpkqTauly2NunP8ETdN1sNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BCZ4YkFzVGQ+0P6+xl2SWHyd0o+/S5t9AqdB0xS3Ya8V3g16o1SwdQzIhwf4lZ7lyBq7E4PfkyacevCrjUddvDtvFH+CQeCkShlowEEZHke3yNNYFtJPFPnpsbHETXiBwReG6kThaa2j1/i39OcZpoV53svqG3GzxKFcAkzgwNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pf9J5lJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pf9J5lJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58441F000E9;
	Thu, 18 Jun 2026 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781767367;
	bh=RfU6DnDGR6cX9KqQoWBCycGMKixF+u+Tk8uGqdMZFA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pf9J5lJ1ElMjov4MaN0JlQFxue+xDYbZihEFDih05iXlMnVGf+TJMIltLj67PsUZZ
	 ou8ByYaXnPY8qdVhrrUPwUE+skvnBvnhU5MC1/tGpKcYu2UUExXqJDYNqFONZRAtoN
	 6UdWlW3FbMqH0iFze+87VUnSsuNsZAYpZMUEaLwBJfIpeMoGKF7CqKGnhJM7pBTglS
	 qom2cg+mx6aYEx5ILgcKRAdiSshooEnH8tNYA15D/5yWDsc44zuXYaPFEy3dHsTQ7s
	 sATYVyQWVMtK1jX6YFtCDpXwveAuArJgk+ils7Z/qgO1E9tj5Z1CXHpm47pnGrPe33
	 tL4oFmx18dGMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/3] dmaengine: zynqmp_dma: Add per-channel reset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618071056.2024286-3-nagendra.golla@amd.com>
References: <20260618071056.2024286-1-nagendra.golla@amd.com>
 <20260618071056.2024286-3-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:22:46 +0000
Message-Id: <20260618072246.D58441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using pm_runtime_put_noidle() before pm_runtime_disable() leaves h=
ardware active and leaks clock references on probe deferral.
--

commit 0e5952f6551c9a8d3b55c9a149969bfbe79c7c9c
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Add per-channel reset support

This commit adds per-channel reset support for Versal Gen 2 and Versal Net
SoCs using device_reset_optional() during channel probe. It also adds a call
to pm_runtime_put_noidle() in the probe error path to balance the usage
counter.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
[ ... ]
> @@ -1152,6 +1158,7 @@ static int zynqmp_dma_probe(struct platform_device =
*pdev)
>  err_disable_pm:
>  	if (!pm_runtime_enabled(zdev->dev))
>  		zynqmp_dma_runtime_suspend(zdev->dev);
> +	pm_runtime_put_noidle(zdev->dev);

[Severity: High]
Does using pm_runtime_put_noidle() here instead of pm_runtime_put_sync()
cause a clock leak during probe deferral?

If device_reset_optional() returns -EPROBE_DEFER, pm_runtime_put_noidle()
decrements the usage counter but does not suspend the device. The device
status remains active. When pm_runtime_disable() is called and the probe
fails, the driver core handles the failure by forcefully setting the status
to suspended without calling the driver's runtime suspend callback.

This leaves clk_main and clk_apb enabled. On the next probe retry,
pm_runtime_resume_and_get() will double-enable the clocks.

Should pm_runtime_put_sync() be used before pm_runtime_disable() to ensure
the device is synchronously suspended and clocks are properly disabled?

>  	pm_runtime_disable(zdev->dev);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618071056.2024=
286-1-nagendra.golla@amd.com?part=3D2
