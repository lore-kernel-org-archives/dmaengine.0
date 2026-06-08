Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B606380FDC;
	Mon,  8 Jun 2026 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898157; cv=none; b=jwMQWGy7XdSuNJLq+CsfOHCIqHovGbdbt7E+ryigZa8A+0cjZE/hJAyjH1Ahs6GcyHvCfgpYvu0dAQQiry5Ejg/mgC3KCc2zCiuYXgBeAMBghO+/tB0E4Jy7JXT35uglIXmJ37HOxU8m1QzECvJ1DbM1IXwZTLlMf7EuExcOZZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898157; c=relaxed/simple;
	bh=bdfkGt9+XBIrmmDnel6Z/6ZuJcT6YAYwlL//yDhjLC8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HKm3pkmfZU+islj+6YsHEHKP4ckrwIkIpzYsqs/M1IWOJ7+qiM+oPLScktAF6o9fpub8ndD7R+ulUUcT6AkjhuKj1xX5LkS/NAnexmYynn+NBntuy4kvTmEwVTssNlvlzgQY5dMNWLTeP7w7tKdx2FlLJ0Vz+OxVwSWVRbA067Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyPoKIKc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyPoKIKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8771F00893;
	Mon,  8 Jun 2026 05:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780898156;
	bh=/psBy+Jgvatfvvf8zNKoD1kHN5hnr8RpxXntok5OONI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=WyPoKIKco7VmL7NDVBM79GDRt3qtu5GoODeti7ZQGDXZHZpuTwIR1kYabDknL8EOD
	 VGLzsQ1oVTVOYd3PXfKVRpN9TB/7VNbQsMt/N4FiB6Y2ODXdyPazn7qjdmx0J5DcH+
	 5haSWZIwmZUShgfU2ub3tY9xcng1u8sB+KZT5OPC7SJb3HxSoHf9l0uXr3zQMqa+zx
	 GplqWfNZv5T41sI46gjYrvCncmlOKLijWBc5lKHVgbXMaFhreRoxAdOpyJliFQgPXv
	 ny1OKs0a9R2udkNdNtsCsqdRNuJieneFbffUQVjgbi9JXI85FUNqh+2DKEwPZ0G5Il
	 j4P9W4eWpHVcw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
References: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] dmaengine: imx-sdma: Refine spba bus searching in
 probe
Message-Id: <178089815387.15844.2917826633500399356.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 11:25:53 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 07 Apr 2026 11:27:55 +0800, Shengjiu Wang wrote:
> There are multi spba-busses for i.MX8M* platforms, if only search for
> the first spba-bus in DT, the found spba-bus may not the real bus of
> audio devices, which cause issue for sdma p2p case, as the sdma p2p
> script presently does not deal with the transactions involving two devices
> connected to the AIPS bus.
> 
> Search the SDMA parent node first, which should be the AIPS bus, then
> search the child node whose compatible string is spba-bus under that AIPS
> bus for the above multi spba-busses case.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: imx-sdma: Refine spba bus searching in probe
      commit: d52d42e2e5d9f13166e81ac837ebb023d1306e61

Best regards,
-- 
~Vinod


