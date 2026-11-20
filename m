Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168870;
	b=mqQipVTNGHgr2TBQHF3bhA8WSncsc5tF2LkCOLOs+PQ12/4Jgrddz0kJTIhKN7tWeG4N
	 n6s1yi+woeztj7dzGROYRhtMS8NLStvvJNI5aJDwgBI3YjCekph4Ybw60HouBgJ59X12g
	 /zjqoe+QtFyhpyWSmKGiVO1nfENxtwnZXY2WNn7HtIvvDju/g+zw5oxVwuGFKrXYSb0ux
	 o+R9tVVZUyAXTdG6KsYiS1xqkptMtUKjmtTw6KCkx08F4YovGUlNOZj7ms+NyQ3VS1Y4E
	 jEHuM4XvJhvAh0EQNQum2jwh40BmIViBhcaZPT/JzHeObQwPBJHem19F9VT0TnrR+8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168870;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=UKWdxYCsXfwDAM1ZMhUEXZe9ymi3WoTtmes4odunUis=;
	b=WB9gXIhojEygJLwymcb9xRhLPm3B5GEn6bnxaZn4iX3JdCAnqEqwVkKXqpZTrIiXSAXH
	 YwHxBDqD9QKaU1fxpco+hit92QmvlOsgH4GbbGLtBOad7IkGF4tjY2MIOO50HIYZyJQmN
	 m1rCApdFXvfjmVkDwIUxbBIS6kpajTTkBQiozw9cQ2giMNBWxSqOxuiqsCYJA9ZqBc3zB
	 9eLz3iv1n58I4SFxqIoF/FUwV+9WBE5xm7dVshfS1GZjTm6Hf7EAVaqStV/HoItHd4pGn
	 UmIyMz//t2jrWWjS0Bjz2ANGRYDBdPoclk6o8r6xBiT86EGkzGKVGYPHD5E6zYFc5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffvqY9DA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9389660A262A;
	Fri, 20 Nov 2026 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffvqY9DA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979E61F000E0;
	Fri, 20 Nov 2026 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168870;
	bh=UKWdxYCsXfwDAM1ZMhUEXZe9ymi3WoTtmes4odunUis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ffvqY9DAP9aBOu7kCoCZpWyWIrIZLL9/wcRMdEz9xmF+yVoh0TnshJde/82wqRAdQ
	 Fi1N0z+nCvgtpl7b5SeO/07ju28qlOvxkhDIc74D+MLRxmVx4mmL8yr3FbslsYM7tW
	 DaPEIbDqrfdRwa+l7D47VuUVchnadNnMRYJv28+0XJpM5MdZvkpmqhRjOk6MrjjVyU
	 rLst4TGoLSat2e1IVzpBnxia9aGBsOkjYnrFDJWW9mkkxvDMBlEoGN9OkqQfuiTjwI
	 4cf7tOLkALsGi34q3E1g6up3p8nVh5+HvJK4LSxXAdWXdDzH4pSAOhgoImK4cwbRlj
	 K3V6I1zxMRFXQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@kernel.org>, 
 phucduc.bui@gmail.com
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Chuhong Yuan <hslester96@gmail.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260923072532.19307-1-phucduc.bui@gmail.com>
References: <20260923072532.19307-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 1/2] dmaengine: ti: edma: fix pm_runtime usage
 counter leak on error
Message-Id: <179516886826.45276.17249093903481883039.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:31:08 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 23 Sep 2026 14:25:31 +0700, phucduc.bui@gmail.com wrote:
> pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
> when it fails, but the error path in edma_probe() does not call
> pm_runtime_put_noidle() to balance it, leaking a reference each time
> resume fails.
> 
> Use pm_runtime_resume_and_get() instead, which automatically drops the
> usage counter on failure, fixing the leak.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: ti: edma: fix pm_runtime usage counter leak on error
      commit: 98316e6234ad9e77e6d6605bd8166d4ad775aac0
[2/2] dmaengine: ti: edma: Fix missing pm_runtime cleanup on probe failure
      commit: 89eb5862847e437dbc9c776c6d5019d396241e8b

Best regards,
-- 
~Vinod


