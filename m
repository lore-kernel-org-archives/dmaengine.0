Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677700;
	b=tXfLFQQ9wkmeADfKrO8PjW7AGZsugjdQu0R9+O/Iqrdmwa3I449+0tIs8QQkz427c/P7
	 KqZZBJVmfLhTsmzIs/ew9s/VjEh7jqLQfsEqGtnDqBvxC9qyjmGxLCOZgXiAS6wBxHKu6
	 9R+LtqSe1o8r+hLVIopmT4R8jDFalnapr0a88kualBB8KC26MlF4TXYvDwAD61oo+U6tw
	 oj14E7tGJSMPPlGRApOPqv9S+2aU5XZl0mZXVQCrHEx2s/JOIxpyXL7QXuQ4n2+IfBXhi
	 VggrENAKcr8uJ7bKMDJOVwx/az11rSAmeyrRb5Ju4JjCoM9YcWdSuddWyuOv6fQRjQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677700;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5ZojtnmsIc3/F6yRUC+D32/HMvjsgQALAlW7R9xX2fo=;
	b=pWvEC4KK21LNO6Wi7Z40WjRPfnKVg69hGqS1YFHI8uPXvMUW4rBVw2EoLlFM+iR/qmIo
	 8lsRIQWYLaSxpRgnr52bA0iYXdzDDA/DUGSZ3JpXpJWyGzKNsoZW3d8X02QyJMVkA16TG
	 uAsH8+jQ/MZZKnJ1BEYU36+yo5F6ESrMeLoFim6uoMk9HZcsf3WDZxR/CpjNzr3ZVo3mo
	 v13GKgYnib3W3ZM6jRhOwa7kEpm4O0pHk4Lmx8iXir8/ZM+G16Nmv/7HtsfKTWxevkBs9
	 PQ3JXjdyrvnYevYRPuxD78caqHi3G94ZIauG8/afa+WNhqDDB5+SljSAXcnwsw3gzEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/HS6Z6y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCA606A31E;
	Thu, 22 Oct 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/HS6Z6y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65D01F000C1;
	Thu, 22 Oct 2026 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677700;
	bh=5ZojtnmsIc3/F6yRUC+D32/HMvjsgQALAlW7R9xX2fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/HS6Z6yOiWqf7fg0SZopYIagYjHfvssuDMpBMP1zBjpLfFkmXF69avT6vj9Mn3MZ
	 URCiHONgUaNvmyMAwTenU3WHsJeYE6yApsPsHMigA6BBeu/TKsdiDjcZWgtQec1WWB
	 BsqJmPNVAuhkb7TrhBFWvnfAOhn1FLqLTY1zYZXx6/CMKhYn80mfFj5RTXP+sxXAyK
	 mI9088pBA5dYPqJe202R1hmka1t8eFoOwrqTqeWlD1do9tvyudvBFIZu7TQO4y4M8q
	 m9m6EEYtchqMvEtSiLVT5wPbyr43QQsQ1x+5Gwk/gfRfx2vjlihP3SwyR6LxN1E+Eb
	 7SFKbg04ESzoA==
Date: Thu, 22 Oct 2026 09:01:39 -0500
From: Rob Herring <robh@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
Message-ID: <20261022140139.GA952798-robh@kernel.org>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
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
In-Reply-To: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain, preventing it from accessing BAM descriptor FIFOs allocated from
> arbitrary host memory.
> 
> Add an optional memory-region property to constrain DMA allocations made
> by the BAM DMA controller to a restricted DMA pool. Access permissions
> for the remote execution environment are managed separately.

dma-ranges is normally how address restrictions for a device are 
defined. Why can't that be used here?

Rob
