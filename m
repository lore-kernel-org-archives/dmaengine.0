Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23AD1A6807;
	Tue, 15 Sep 2026 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493767; cv=none; b=tVWUOgWep+f93ENrKBpwh1eN6yjiuZEr+1p1QabruSwi59HRVf7/ByhcZypME76LiTjynTwk/QkEGww9iLXf1VjTYYiNTIfIHnJ8o8I0Q3zo850oe4U+rCUfEbQ4dw3MpxVCz4LsS9zOwcd0Epg8LTx4EN16g03lwTEVsdV7Zig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493767; c=relaxed/simple;
	bh=eIK+SJCvmWdsXGH77VbvJdK0mvEGp+crRINjOY8yWDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P8lm4E2bilt9ZX5ZvG5/QaoMD0YFWl5unoD91zRpcOhSBe72Vis3PKanfhJZs0x5MikwSEajMvv0iur1Tb888Lrsg96THdxPy1QZRrkFmIknxpdd9vm0VrWqSJoTRsgHYP8Ebw4aaYJ5vyv5q0MzzOXRku9jSF1oAUADEtrOYkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzcuT3nl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzcuT3nl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D52E1F000FF;
	Tue, 15 Sep 2026 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493765;
	bh=cFqbhMVhAg4XEDjTSlGgn7dCY4LvrFBCXwQMm74XOaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XzcuT3nlg7iY/Mytd5u8QFphs4N/BKfmafYC8aDsHp9+hfdM+q6Dj/+GKlPk1ue2q
	 grLpC760egXMQIBbXStu6aOZ5kYy01dJOyQ6t6EoU288RSiC25NrapoXHOdv93z7Ot
	 u/tENBq6EXEhnucAmwfdlmkKleYEuYT1zyOdCsBQraigV/+DTDeQvPuVRSpsblP2Jt
	 8I5t39LyxY2PILxXLsuA9kF/wYw8m8S9bECM4CGtzumiDUIffFi3vSiVf30P2w57Su
	 6EkOdvCCL9p/9eU2PjXMViquzUURbVKEi+UAYUxLDY/jzorpOUwx6O3kcupmhr8yVu
	 2itOPrzjCiVGg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260909232623.89321-1-rosenp@gmail.com>
References: <20260909232623.89321-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: use
 devm_platform_get_and_ioremap_resource() to simplify code
Message-Id: <178949376415.248239.14758235606477908491.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:04 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 09 Sep 2026 16:26:23 -0700, Rosen Penev wrote:
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies probing.
> 
> Fix a resource size mismatch between allocating and freeing where
> request_mem_region() and release_mem_region() hopefully use the same size
> but is not guarenteed.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code
      commit: 0a8dda0a15d3926422d286567f945a05328a4ac6

Best regards,
-- 
~Vinod


