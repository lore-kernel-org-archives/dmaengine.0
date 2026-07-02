Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB5D37A84C;
	Thu,  2 Jul 2026 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006321; cv=none; b=ZLHA9t0crzH30DwdSQ/1vbuZh0QsAaMhkwMAGR+4dtn/MhkDbG/KpzA3Px6hw1AeCzcjXuhq0Gn08Hazexj+s9lVVHw50UIOvbeHZ5PeY7w/3v0OTDLgqipMGEsAbZOhRIDsfgmf9wpB7a5Vyyy+jlTkwkGRc7jPDgi2EQt1uDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006321; c=relaxed/simple;
	bh=ej5ffxlxmBX7k3eAVgmJjvMD8D7UBtwZKXKVYiOzrBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C3XqJ7Tb3n6c6bU5PSsDevsB67/kCSi/VLzHXFE1cQI8jHRM1/el3/9yiMLX7vh70RvMyM+TptqYK2h5nINj4ogmi5Sk7FlmioRm7SFA0sCSTWtGivVuD3rqqv3fBOtI/2bgHYVE2wT2IyfHMx91dNZ41qv5mQJx8o8dKdA6wRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LALP5/0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LALP5/0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304361F000E9;
	Thu,  2 Jul 2026 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006320;
	bh=2D8xcIiL/B53PrISjZmLTQU4Q1DqEytDTcdKmGqFAkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LALP5/0ywp3OC8ZL7OzXukibmCm0vLntQpem22wvj/qnLYFf/GhUyXMV4nbaXYbd6
	 Nim+HFnm0LYLGKoD7mK7B7sdVx14DkNlXkS/ITlXGzV1BafeBM9z9MRJgznsOQcWZD
	 OkwDiIvT6LTjfGzPnqAv8VihxbUuuJeBMqV53b9v35oJfZUppqcV93d9OTBBNe8F/C
	 WjcEKsRl8B3DZqnwmpEfktPn5nn6UM9pb8BQcTNC3sVTkK3IaTwHmkFwa2E/JKvIRr
	 7URRcB/IEdzoyrNB50sKZDdtZke8s5b4JJa3gNiGXrgpR3bjuw4pgyt551nhVXk4pb
	 aDa/EIIwoLKmg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, michal.simek@amd.com, radhey.shyam.pandey@amd.com, 
 Suraj Gupta <suraj.gupta2@amd.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260625161016.1249570-1-suraj.gupta2@amd.com>
References: <20260625161016.1249570-1-suraj.gupta2@amd.com>
Subject: Re: [PATCH] dt-bindings: dma: xlnx,axi-dma: Restore
 xlnx,flush-fsync as u32
Message-Id: <178300631680.735405.5286832164780431530.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:01:56 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 25 Jun 2026 21:40:16 +0530, Suraj Gupta wrote:
> The DT schema conversion incorrectly changed xlnx,flush-fsync from a u32
> property to a boolean. The original binding documented values 1, 2, and 3
> to select which VDMA channel(s) flush on frame sync.
> Restore the uint32 type with the documented enum values and fix the
> example accordingly.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: xlnx,axi-dma: Restore xlnx,flush-fsync as u32
      commit: 287bdea77529e6abac5fe15461d93c1acdcb07e9

Best regards,
-- 
~Vinod


