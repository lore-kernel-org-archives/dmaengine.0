Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474032AAD1;
	Mon,  9 Mar 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042229; cv=none; b=RVbQevUPC1tZWVncl1AOKwfXPBJoyNP5QL7kRB33pwqinIgqS6LOCTdZTdOmUXfjIYeaob4xSQjgLzF0gmTU0oJ+/KaGe0Ib0gvrEN1kwO5UWs+zcGgrquLELUo3UCen7wzFroy/195S8/3lvH2n2u6sE0A0ZgPd426mWuTv9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042229; c=relaxed/simple;
	bh=ovNz2YP3fjKRMo/3jyIyHa4n9KZ1wNV8xnIWgGVFArc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U7CjwRNr6NTTeYmhr3m5y9fY9gXDAp/OYJTzR5ZlG9Wogu4Lo2emNNy1uaDh650fum1Nfta3iU9WruDzBHfYZn1wCxdUIusEdPi78ejOGuuDHiuI0+m2EDCqqDfBEKuud1IFweVFXT/XO/jB30Kbpi4g/mBxrB2qlEjswpLjCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XU96g7wT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XU96g7wT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC20C4CEF7;
	Mon,  9 Mar 2026 07:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042228;
	bh=ovNz2YP3fjKRMo/3jyIyHa4n9KZ1wNV8xnIWgGVFArc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XU96g7wTykAX8nbg37DtCvkeYXFDntGcaLiX9gCBIe3TSbWACb7wDQ1wCVha8ZjOM
	 src9Ik+6P8/pQfh0uSSXH9I6h0WdIQ0E5IzSSXicHg8sndCb3shFPUmq5JD7Dfijns
	 RtQziRdnqKN6XAeXgjrG1fNJQUS5x6tB0o71Q+Fh2LVvskbxQVHjpOOe+M8sHlWvE4
	 6IaQfe/52k8dub0SHm87FWtqow4OSMbdqlbn0l3mks/VEId+bF+4toBwZgEP+DxSqP
	 rjFLC8n7nBiLW+r0puLM0LMyP0elHXasERKQK6+/kIy/MqFQJBWtOocCSHPUpoUMPy
	 NuhUYNZK5solw==
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 LUO Haowen <luo-hw@foxmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <tencent_CB11AA9F3920C1911AF7477A9BD8EFE0AD05@qq.com>
References: <20260304025049.324220-1-luo-hw@foxmail.com>
 <tencent_CB11AA9F3920C1911AF7477A9BD8EFE0AD05@qq.com>
Subject: Re: [PATCH v2] dmaengine: dw-edma: Fix multiple times setting of
 the CYCLE_STATE and CYCLE_BIT bits for HDMA.
Message-Id: <177304222699.79304.11063129892083926074.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:43:46 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 04 Mar 2026 14:45:09 +0800, LUO Haowen wrote:
> Others have submitted this issue (https://lore.kernel.org/dmaengine/
> 20240722030405.3385-1-zhengdongxiong@gxmicro.cn/),
> but it has not been fixed yet. Therefore, more supplementary information
> is provided here.
> 
> As mentioned in the "PCS-CCS-CB-TCB" Producer-Consumer Synchronization of
> "DesignWare Cores PCI Express Controller Databook, version 6.00a":
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dw-edma: Fix multiple times setting of the CYCLE_STATE and CYCLE_BIT bits for HDMA.
      commit: 3f63297ff61a994b99d710dcb6dbde41c4003233

Best regards,
-- 
~Vinod


