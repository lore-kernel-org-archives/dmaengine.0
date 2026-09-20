Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B68314B6E;
	Sun, 20 Sep 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900361; cv=none; b=Zj3pUVvJKxsJk4o1zwSUQeEE28flVRC2iAWgmocmhVRB7U0hcIsHvOHi22/v9TePREcCpWVJrPceBcEsosiisBYiIuAw2f8fknc7AiX7x+m3Wayh/PoRlGYjRb2WUK0Zs6KdEdwqJTca94JYgxTVn9pQte2VLM3zyamxG0iVhwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900361; c=relaxed/simple;
	bh=BQorMNqKT4Ikb5jtSDXI6dMEPLiTduGjs7g334xfHCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkMDHvnqdAuCdASavyhOspm+lvkpEM53i1db80hk+ypSBOYP1hOhnPbqM99zsqEIr9Oj011vBwl3A+Bqd/NCx1wuXDFmCfyvBleekwTzy51JsVOmwr7hdNMesaForCKnFv8t+zRqTqWHJ17GXpmBdS1KGepYhUJlW1nrwosSMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0iMCr7Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0iMCr7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5491F000FF;
	Sun, 20 Sep 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789900360;
	bh=XJRg6NJgyLy/TngByO90WKq7J+wfZkhzCS4eBE29tH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k0iMCr7Z61jBfyFPgvLgYc688ggOSM+PX6teotiBZ7JFD/QV55/dBIr+iUEXoS1n7
	 vvxG+l/0CylSFIxgtWF9S6gN5Bw3bTc5bo4amRvVz+on4URoWVJVPCi9smDFD2g24x
	 eSF9BLLTNLBCxAlxr4LcOXtmRBTeAgf3k6vyPyy+uLOaPXd0chwWLCmxJBjSLrtvkb
	 k/gb3fdCUGuSYG4Ycvx+9shGx2QQuAIFCNs8aiwQNJYGDKMoeSeAN2rNNglCnQlvjG
	 r2O+7rVbF0shcflXCr0Xr4n8vdHLJLjfy9eCT29RIGxSz4imFPEM8EsSp3NugVYOie
	 JRwcvJ1goYzzg==
Date: Sun, 20 Sep 2026 12:32:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
Message-ID: <20260920-girlish-acoustic-raven-d0f8a2@quoll>
References: <20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com>

On Sun, Sep 20, 2026 at 08:03:05AM +0530, Vishnu Santhosh wrote:
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain, preventing it from accessing BAM descriptor FIFOs allocated from
> arbitrary host memory.
> 
> Add an optional memory-region property to constrain DMA allocations made
> by the BAM DMA controller to a restricted DMA pool. Access permissions
> for the remote execution environment are managed separately.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
> Changes in v2:
> - Replace the qcom,vmid property and BAM DMA driver SCM assignment with
>   the standard memory-region restricted DMA pool mechanism.
> - Rely on generic DMA handling to constrain descriptor FIFO allocations
>   to the restricted pool.
> - Drop the Shikra-specific BAM compatible and all BAM DMA driver changes.
> - Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com

And a reason to drop review?

> ---
>  .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> index e72adc172af102d8f400044ea0dc32db6b2365be..1e4324799f2b3b8a9ebf9f084e457e66aad20d28 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> @@ -50,6 +50,13 @@ properties:
>      minItems: 1
>      maxItems: 7
>  
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
> +      The BAM DMA controller uses the pool for DMA allocations, including
> +      channel descriptor FIFOs.
> +
>    num-channels:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -137,6 +144,20 @@ examples:
>              qcom,num-ees = <4>;
>              num-channels = <20>;
>              qcom,controlled-remotely;
> +            memory-region = <&bam_dmux_pool>;
> +        };
> +    };
> +
> +    reserved-memory {

No need for this.

Best regards,
Krzysztof

