Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975276;
	b=ldxSLMUg4G8SzD8mQF976PJCtHy5GzyABe6BBRisDeWToTX4vgza6GzcGWn4vFmZnrCu
	 +9heURXNvQzJe0ieBBQgfQj+i1O6H1J5kTmCx916qZtmK0KziPWuwnr3aeN3l2Yd4VEEw
	 j9xA6pKF7vVr+2vfigCRChfgnwV/Y+kAM+IIP1Tla8a1Bn1pgHRbmFn8M4WQMdKn0CWo+
	 wms46vAT71aV3JPRcTI+mjPZQnaC8rF7AKOSan/fPjLJGyU2FAbnOaenfn6fqvPUU9RgW
	 Mz0YhnuiQmuk/8gZQO0UAnF8SrydBmhQZtT3wSVWpbwB76bVG+ObkGT4C+MWVYX0RUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975276;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZqpZuSTieI35n54JABBHGpmhrcnhM+09HvPoDw0y7t8=;
	b=ynZMdHdk2VW9A/Jgb4oiw4l2P/sFPcVqb22/vIog3HADeehiswFk2xcF3xNfuHLGftdn
	 +OpnuZiEu8JTAnJ+ubmIyXsVv96ACGToZwTAeu4RCRG1ESxdXzt9YEnl/Q/KHW+ZNMoNu
	 BtP0suxFbvKAR2BW4uL0D6VFKsuJ784cFC5AMO1OsC/YKlJ8ojTiTDHiDQuq+t3LTVPaH
	 4NuWiL4Qo94U/iDPeAoAM4xXOTzqci+QxZ83TLfnVqWKwoWyuEnR1kY7gu/Xo9OuZ0Mdz
	 UfKHfzTlo+2Oedzx0T+XBcyfaCqX++Y7e8zOUyc9SIfShi6IzNnPSWhJTm8VEsljkkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyeBP+gC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D9606A32E;
	Fri,  6 Nov 2026 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyeBP+gC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDFE1F0089F;
	Fri,  6 Nov 2026 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975275;
	bh=ZqpZuSTieI35n54JABBHGpmhrcnhM+09HvPoDw0y7t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LyeBP+gC9i8mU+0eXC4H9Rt439e63hUaNqg0tEAnqsPicgyROanmOXLMZrwDKavOq
	 c7TFg3tZXalZSMbkDDsc9HWYn40Eok0aWhsJCCFEJe5f9l3N8QtrfUp6/YiaDR3k+p
	 Cwl2+pAi4AhxWqg6pH9EYie4OIW2beNFFIhpim8ssKbQFxEo5U1tJ1kz8aAXNIFVYs
	 s3ANGPtCJMQL3byYiqAQQkSRHkrBX9EGpRRxlE7e9Ma1kq5ntiY4LYv+rnACV3kiCV
	 C6SqZqi3gZ7nGjhF5v8w5lYTypIw5nKAwizr7Leyhnshc0f501BKeVqFEtkxcD2bag
	 4fc4dYB+m71OQ==
Date: Fri, 6 Nov 2026 08:27:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Harini Katakam <harini.katakam@amd.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org, git@amd.com,
	Abin Joseph <abin.joseph@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible
Message-ID: <179397527077.3110134.7259234155472672168.robh@kernel.org>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>
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
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>


On Fri, 06 Nov 2026 15:40:24 +0530, Golla Nagendra wrote:
> Add support for the amd,versal-net-dma-1.0 compatible with
> xlnx,zynqmp-dma-1.0 as its fallback compatible.
> 
> Include the Versal Net compatible in the reset requirements,
> making the per-channel resets property mandatory for Versal Net
> devices.
> 
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml           | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

