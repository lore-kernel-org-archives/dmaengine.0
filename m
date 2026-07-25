Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9D81494A8;
	Sat, 25 Jul 2026 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784993093; cv=none; b=jbUlHkk4H1JTIviFXikI85FghIehQSUgPOQ7GkqPTpckp3hJevmxqJUiswlbi7ByhFp91mxQHpQtTZpuyR2qppmYfATYotbWKF5aEITmIUyHK1tH4ZVm/BpiDAk/ZjnzUyqdIP7f0W01hYaQRKUwz86ZSys3iTyrAA5T/XTAzb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784993093; c=relaxed/simple;
	bh=705DzC5cgsjSoiDYkMRyQ7CiNkY2R155gzrj/G5RcpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmU2IXFrKycF/XisnzoQkWfGFXT3lwsgTnxtqsM4e7oztCV5cPI8m8al77X5J+fME5XhZpmq1RVkeFiM8eGCpvSf9GjHUmBJDEqcokS5254xevfyC9E1l5AvLG3OxUnDXLvm1SSUwr1aYYPBvVwYi2z+yJq1cVzrpstm0hQcpVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQufEFhe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQufEFhe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6BC1F000E9;
	Sat, 25 Jul 2026 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993091;
	bh=qsGh62njhoKlewROetP2PvNKUr3a3BT6K5c3XMORfWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OQufEFheAC7SqbrvLG1R2l/zb+kY0GUNTGO8s949cIv/7E8ADyC8Vnzmj/t1bdn6Y
	 GKOI8WWejexTVkqWZ7RTJ0BmO223lS8IZulq/V3FxF0M/M4ueUO9Ln+2b3Qe3XsU2F
	 COGEOTEDoHT30+or0iqq78vwXC7nSKILbXTz580sG/3tTlSrrzSl/MBoNQA0/GUk4Z
	 LWpKiYMiEHXfMluV5W9ArtFhW4K30DwwhNhrnyylAHvZNtMQ4fM96H6qDFgveuEUDP
	 ncjrWvDO4r1/Vudpz6Vx1u2yYzoX778fO2kV+ysbV4A0hjkimiZPprpw3mcm0/zo91
	 3MoMVGH5G4DmQ==
Date: Sat, 25 Jul 2026 17:24:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v7 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Message-ID: <20260725-acoustic-orchid-tiger-a6be5f@quoll>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-14-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724102115.2854-14-s-adivi@ti.com>

On Fri, Jul 24, 2026 at 03:50:46PM +0530, Sai Sree Kartheek Adivi wrote:
> +  "#dma-cells":
> +    const: 4
> +    description: |
> +      cell 1: Trigger type for the channel
> +        0 - disable / no trigger
> +        1 - internal channel event
> +        2 - external signal
> +        3 - timer manager event
> +
> +      cell 2: parameter for the trigger:
> +        if cell 1 is 0 (disable / no trigger):
> +          Unused, ignored
> +        if cell 1 is 1 (internal channel event):
> +          channel number whose TR event should trigger the current channel.
> +        if cell 1 is 2 or 3 (external signal or timer manager event):
> +          index of global interfaces that come into the DMA.
> +
> +          Please refer to the device documentation for global interface indexes.
> +
> +      cell 3: Channel ID for the peripheral
> +        This is the mapped_channel_id assigned to the peripheral in the PSI-L
> +        endpoint map. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO
> +        has a distinct channel ID; use the channel ID for the specific
> +        direction and chip-select being requested. Use 0 for triggered
> +        block-copy channels (cell 1 != 0).
> +
> +        Please refer to the device documentation for the channel map.
> +
> +      cell 4: ASEL value for the channel
> +
> +  interrupts:
> +    minItems: 75

You can drop this

> +    maxItems: 75
> +    description:
> +      Interrupts for DMA channels.
> +
> +  interrupt-names:
> +    minItems: 75

And this as well, implied by maxItems.

With these:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

