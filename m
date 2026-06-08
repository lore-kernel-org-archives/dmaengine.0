Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE323379EE1;
	Mon,  8 Jun 2026 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920786; cv=none; b=WcyoXV9DGVMand81UUgPFtIj465WZiXb5PMA8ZjF/jUFxcb70+ddlSGs8bcJ6DPhctie4Sn4TAa8IiUdzAAYQ9oxtgZeSwtzp+kjUbb5SAKDrBXB7Pv7nILbXV5AhHtztgh1qLPomL+BJJmcq2OSqL5xTGIjLuqbD5h+y1O4zTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920786; c=relaxed/simple;
	bh=GxnqyqZ3arggs5PfbPz83AkE0AyEFHWjYwsV3cC0UD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L+t9+Em/MJ9Q9P8JP7q2hz46EuW91W01yG7wpIS4wdZ32Uqa/Cp+VvtuRbvwo2M7C2sJxieNu1jzG7CSq11PooG4W7NcLIUZnmaW+640uQk5G81e1+yGDV6Ad9M0sWAljl9kqqlcKzA6lcen8nS0C5+/0qtc4ZlVoL9BVPkd5bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdnLlkOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdnLlkOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDD61F00898;
	Mon,  8 Jun 2026 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920785;
	bh=PSuV9XD/IvJvXJdHzkFwtdkH0iM37burKxF+8m7rWlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YdnLlkOm0kUR9fHa4IiF1PqgR8CIFz6pa+dW8a6BySUV+DVzIUX3pFeiasPKExVKI
	 z3IEXhNrDU7Q0OCNZRfu4A3uxrR6MWaMzGaLzo/vuulmjcyEz5+JwYnuIlYwKwQSDJ
	 yrP4btkDvSn5dptFWZPTbwxG96OSmEAjZw2u98duYGhi5YpErdo9y26JhkjRm6s14P
	 7YmL3YBaXtVo6g/yYYVHOdshRP1yO2KGhn1FG6wHl40ykISASgHqchg3FP0AXAdmvR
	 FXrmsM62r+TXo01HgrezskkBPNCwJ+cYpKc7x5dZZLen91AunYiqC3hUwtsKGfWjfZ
	 xKu93R/joaWWw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260530200322.7584-1-rosenp@gmail.com>
References: <20260530200322.7584-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: dmatest: split struct dmatest_info from
 variable declaration
Message-Id: <178092078392.96550.10787300371908107087.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:43:03 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 30 May 2026 13:03:22 -0700, Rosen Penev wrote:
> Combining the struct definition with its variable initializer confuses the
> kernel-doc parser because __MUTEX_INITIALIZER() expands to contain braces,
> breaking brace counting and causing:
> 
>   Warning: drivers/dma/dmatest.c:152 struct member '' not described in 'dmatest_info'
> 
> Split into separate struct definition and variable declaration, which is
> the standard kernel pattern.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dmatest: split struct dmatest_info from variable declaration
      commit: 87aab0781cb35baa2214d0a95ff01e786e428226

Best regards,
-- 
~Vinod


