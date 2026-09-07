Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49791430794
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788892; cv=none; b=d6akKKGXkjjcB/Yph1pD68gmJgpvJUYJAyiC6tZMDyBVJ2v9TzLtV0JqHpNV0PYK/3NhfRdrK0n5IO476/qcTQ5CUYH3gnUWU88yyg7qKCsN7a5buG/Yhr/5sTVtnJzCO94WFQmUp0yTF6FMZXyv2zS/csmkvznu3kuZTv7akV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788892; c=relaxed/simple;
	bh=QD1Da+FUgtvES6xU97R4PDoZ1RZ8YytRbtkumXFliBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1i1GPOwQwpq52Zl1AP9SBZHJyBkkERHF4C64CEgNJhIB76/a7yIa7ZsvPTpmWs4PnYomPnMhwfBA0u86E3V1OEhrudSQhRsIO0LhzOKMuAdNCxii1RFTXw63khxcFSNyb3FksKY30ni8qP6JjMxLZpDWODeA1rgg6aj0/NN8eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLc20YSK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLc20YSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A51B1F00A3E;
	Mon,  7 Sep 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788887;
	bh=FdfVxsaU8ntnPq9pCM0jsQuenmMunSddl+JMw/+izIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dLc20YSKdj3E2q8oK4WUvWb9Mzi8Q3a3Jw6YhsJtExD1LNoO46vnn0fis5wV+TMH/
	 GmOik5EsbOG56pIVxt+QnqcVpAmhP0rIZIYFG/qnHwoP56Pf8EYkbzKcVycGXJFiKh
	 IvHVRktKSrgviUXtVonSQK2fk44MQDDaBt9iJ+bmT/vgPMkmuGb1vqlKWb1I/apzCe
	 DDQRLi6pJT9uuodcQ9b3fqfWyiVItcIl7YoJ0gN42pS4uJ6E8CuarqvL0PP3vu/xVH
	 REjGsPIU5Kk6LqbjdnCHp9MmS/NTYnUIR8gelCl45kuJ8RymD9VMQQW4+voTEwaKld
	 XvDF7JK8F29VA==
Date: Mon, 7 Sep 2026 19:17:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: zynqmp_dma: drop redundant label
Message-ID: <ap7AiYBbF1tbHt-y@parshuram>
References: <20260903170357.1711462-1-vkoul@kernel.org>
 <fe1ff210-3a77-44e9-b092-76995ff3469c@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe1ff210-3a77-44e9-b092-76995ff3469c@amd.com>

On 05-09-26, 21:01, Pandey, Radhey Shyam wrote:
> On 9/3/2026 10:33 PM, Vinod Koul wrote:
> > Commit 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> > dropped the use of err_disable_pm label causing warning:
> > 
> > drivers/dma/xilinx/zynqmp_dma.c: In function ‘zynqmp_dma_probe’:
> > drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: label ‘err_disable_pm’ defined but not used [-Werror=unused-label]
> >   1171 | err_disable_pm:
> > 
> > Drop it
> > 
> > Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> 
> Seems Fixes tag is incorrect.
> Fixes: 3f30db282c28 ("dmaengine: zynqmp_dma: Fix chan probe/remove error
> handling")

Yeah my fixup tool picked the wrong one, I have added this, thanks

-- 
~Vinod
