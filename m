Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FD3CD8B3;
	Wed, 18 Mar 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833262; cv=none; b=nhCh5u6D434Ilwlk9sKNfkJ6ukls+GC2Jn9xEDecViIz46EXV76yEJqlrqA+qHSKPVEUW4y9KJUPpCsJHKGTZotm5LnXuQOZwBXnzW41ST6iX2whtzORQnhsGloypEHuq6bCzrX3aG8yh4rXDBYtC4P+ctOfVOphsR47i2j8ask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833262; c=relaxed/simple;
	bh=Xgmj0ENYxt9SaAWEdyGP+9MzNqgFEFkdg1dWBj+Dhao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qnXguj9KddL+mkdHaxNlRUrEOF9dAIUuApBjg/CdNB2Li9WhOhLHEq8M9QSsvxmFfxaPo0X/pxxBEe4Q3oafuU6vEtyY6gNlCFZroBer9c3tzRZ0lap+rONYBbnNczXPLA38SgsUa6/DJcw1A0xYL3JcyEbGGDGaayg3pd9GG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aizp/nDn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aizp/nDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5D8C19421;
	Wed, 18 Mar 2026 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773833261;
	bh=Xgmj0ENYxt9SaAWEdyGP+9MzNqgFEFkdg1dWBj+Dhao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aizp/nDn6rZ0J/0s44N+8UnQXGAeeoWHeMeM0pUQLaY4ZUsw3rkJBN3D+QNzfMgo0
	 R0emIWcyZ6UuFfKRnWxn8jMfpYGj96b1RgIhw1hfWtpxzx1dAx4GwQz8T2VxnczwCT
	 Rpctj4fmzJrQxWcbqVzqzK6iVr/x0FWMt33ffiprxn3IdBv7LiwHLNh16sDa/Oa4GX
	 Qg7VAr43WbaEe+0V9hiE0HPr4LnWAt+3pjHQu4KyhWfnswvNgOUBf/ELcJtW8puy/3
	 SfDQQf97E6m+yXollhQ8R4JtlmR9bygqvKl/VueUqHv3TwR1JpQvW3cisbV3RPjmOG
	 upwcX5VGopRBg==
From: Vinod Koul <vkoul@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>, Frank Li <Frank.Li@kernel.org>, 
 dmaengine@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260317204631.120332-1-colin.i.king@gmail.com>
References: <20260317204631.120332-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] dmaengine: loongson: Fix spelling mistake
 "Looongson" -> "Looogson"
Message-Id: <177383325982.408483.14890778055704333842.b4-ty@kernel.org>
Date: Wed, 18 Mar 2026 16:57:39 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Mar 2026 20:46:31 +0000, Colin Ian King wrote:
> There are a couple of spelling mistakes, one in a comment block and
> one in a module description. Fix them.
> 
> 

Applied, thanks!

[1/1] dmaengine: loongson: Fix spelling mistake "Looongson" -> "Looogson"
      commit: 4a2759a3ae10bb2e6465cfb01c16d0620a1bc7ab

Best regards,
-- 
~Vinod


