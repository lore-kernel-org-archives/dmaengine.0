Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133591;
	b=L9gdjGVnqcdVkVuLC1+KZ+7UgaJur7baE8E5h/ikPGK/ounv6qyPxk+7q0+iaah43nPI
	 Tc34dvWANg8hjIcv4U8zhf4j9it67fdEwmPkh8Cd8AposR/pfIYuu1PDpXm5eKkuI5BUp
	 gvOo83U5RQ6Nkyqmr/AhmT4XQZROhz3aJ00MwCMeRLli5FKCs7keFfNxWsg649GP/iH6K
	 BJ2BO2QZieK+YtOc/xNa9UBYjge8QmiAyH2YCdRExfoU+iTwYbHwq+T+nvEjPh2TiP37W
	 GHQl+60B6k3YufDmSAZhUx2a3pjv/HI5kguzAWuaJirWriCw6qyyBpq2QfJgq4Oitig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133591;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YHtJyabGgQzsf8Hg54sXAUggOBZUtwI2PTxu8lZAsv8=;
	b=EOpZpezeYBQwgKYjr9/qzJZ4O11Z6Y90hzSR8AhsNQcp215+1Go9FUVs7G8Hy5sfpZsy
	 7akW0ZTNS9DQh5b2+RIzdZT45aD0Lk4edhnmX7p+Y/XRJ3PSieWszt6eq1WRFSYTVyrIb
	 VHLOvwMQQiGblftQ3Ql5vROQxTLKyGc0iOxczAH10MkZ3PCYZ3yLrCCuBRZyC1ri+l9nB
	 LJyD3cSRZEp83U85zJFA08UhV3BU1hjoOfYb/6dRuEB/1NkYseteC6V7audiRjAqZox10
	 G+SBP9vEO/53MkrjdV7lfvwd4mMqcIjssc3rZ5npFWfxZVprWXAzzRQQxvwKSfjWITA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fJVIHD8/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AF6606A321;
	Tue, 27 Oct 2026 20:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJVIHD8/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064CC1F031E1;
	Tue, 27 Oct 2026 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793133590;
	bh=YHtJyabGgQzsf8Hg54sXAUggOBZUtwI2PTxu8lZAsv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJVIHD8/Rhrw4vEV+SQJl2LXDO9epWVhgBuTqiKHKXVddE3TtcFCBowA2BKKI/S0p
	 7chsjeNknO5y0e6e0Xw9uG6mZFrTfuGJ4NluAXPR7SJNqKGeMC5JsznQe+/SJFS0Lf
	 zzpG94d1GOd+7MN0e08jGgeZI9rRXgG1Gq8KeRxIowGl/pDCL6KdY27jjSpmsHqFRr
	 VOLibSk/p+hb/pFJ1h5H9sLHLNQMujXo0+YH2oWyITzM/PbaP2g2QkLplQXRT5hTca
	 y0zsflOVk/nvhZuD79+xU0ZRsOFvjt6qoXPiElJ+YuHIREZW8lOleIU24Ll3/jx3dw
	 uwEUkJWtpPJig==
Date: Tue, 27 Oct 2026 15:39:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Joy Zou <joy.zou@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: fsl,edma: add per-channel child
 node support
Message-ID: <179313358476.887731.14779042723433167551.robh@kernel.org>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
 <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
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
In-Reply-To: <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>


On Wed, 30 Sep 2026 14:26:09 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add support for optional per-channel child nodes (dma-channel@<addr>)
> to the fsl,edma binding. Each child node can carry its own reg,
> interrupts, iommus, and power-domains properties, describing a real
> per-channel MMIO region.
> 
> Enables per-channel IOMMU stream ID assignment via the standard
> iommus property on each child.
> 
> The interrupts property is removed from the required list since
> channels with child nodes carry their own interrupts. Existing DTS
> without child nodes remains valid.
> 
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml          | 70 +++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

