Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169080;
	b=nJdAEQyisrRyxjsyHkKKw1zmKLHHzmJMcRNIEO3WqWANPVH0BYsSq+azs5lw6onGj9gi
	 yahbg4RjDgTK7FGwR/BsFODW8Nx8/O34sbqnOs/4LPiDgLw1NIKfoaz1egKf27kdT1c7m
	 VPlgI8cx/ihan2PQ0hdETrZ3AJEaDwNOxMYiY6OVa0AgqcjOLq4MH5CP1Jfov9S7DqcCf
	 Ps8EjrGwg3iWSQCni5QrKvy1lJO0TV78gzfZpBQj035C6hBoeDkRqOdHNJarg2nw30Qfv
	 Q52r5/N9S0lekYj/pCNwi86Ac9SmsjDGPGakj7ZDFA1UvdktTro0qmTDsQSiqsLbM1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169080;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=OzsuLD70Bqy9kFNPtsWpsCxx675AWX9kxtCDvQjineg=;
	b=wRnPHi8aama6CRfPlbyyCdLSjybqyXI8Zybj4LdzO3AEqk2evqUtLTJQdPd4KbYfzMMf
	 ujKlhzQWzza8U6lFHIKT+TBvjVhaKQW4Uqzym5YMIhbG7NTq02/qQVq3YaRRTpQp1bN4P
	 vVNgOZCWZPOFieyN8g/6lStYmXeW/HaO9GHCfH/ZSc5Sbt/EziSoqT88kATi5H7091bGF
	 e3OBLv0DSVvxoqH66y0/9VA6zDH07WXqfcYKDFnQPBPwQfOGGtxHzbwOSJiHwXfw+g2T6
	 0UdEOjfgZVr6o/llBa0OYAQygzkGRqDIrxR4eyQYd/RmuYV4a5WMNc9juoXwRgoxsGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AmNRiBJJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F1606A33A;
	Fri, 20 Nov 2026 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AmNRiBJJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14261F000D2;
	Fri, 20 Nov 2026 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169080;
	bh=OzsuLD70Bqy9kFNPtsWpsCxx675AWX9kxtCDvQjineg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AmNRiBJJWX3oXHJPVx58UZljfrqjYHb6dEUBQZDpcEX6D4jkUmq0d1d73LSyj9vuK
	 b6vBNW2rp5if7WAwOMrkT+6mKLGqn5bwYJiZ5sMg4DvEAO2T988ftCaP5+ohV3J9XZ
	 jkPv+sHgh/F5grNF5ErKcXvgNKDc57vls2un34dHFn5Ut62bXoG/g5bii5WHHrmjXL
	 pSXNYPguKkk0MML94RNNA1tJ+oUztImp0jcRB/+rNiQEMSi7mRjmp39ZdVbBURjgnh
	 vVAopHBIUIukPhpc6Rz3cqLufzdpxfncpLdvE9Ndvp91xBx4zoROuRCfxcXKHjS4Ji
	 lT1EqRWWNdJtw==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
References: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
Subject: Re: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak
 in pm_suspend
Message-Id: <179516907748.54365.16971204267682074561.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:34:37 +0530
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


On Mon, 02 Nov 2026 18:44:31 +0800, Xiangwu Lai wrote:
> stm32_mdma_pm_suspend() increments the runtime PM usage counter with
> pm_runtime_resume_and_get(), but when a channel is still enabled it
> returns -EBUSY directly without dropping the reference.  The matching
> pm_runtime_put_sync() only runs on the success path.
> 
> Each failed suspend attempt therefore leaks one runtime PM reference,
> so the device can never runtime suspend afterwards.  Drop the
> reference before returning -EBUSY.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend
      commit: 34c8c2ea213aab7b452df93e5b7547f4459a49e9

Best regards,
-- 
~Vinod


