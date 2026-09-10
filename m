Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD88D49DB90;
	Thu, 10 Sep 2026 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049419; cv=none; b=CSlJzuIsusRmTGWCoJ17nXzOEraBL4ReybkZqE8CU6nlctPl5QEQV9g9iJQVmuCRULOchxcvkBGoFfsSOeVUhBgnZUi09oc7wTfX7in8Cc0RxAfv16nInL5DpCpkiRPU1FrqHKTI4a+T9gjGeM07meaFA6dZ3l5tYnb/wqey7z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049419; c=relaxed/simple;
	bh=xPn7lBJh3UcSMovXjBiwKepGFUR1yjSDG8DGbx7BfYQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=udQFl2lXGOyTk0qHhW/YCVRMc/pxRKF8fmm8R9/kGsSUu1Dovk05FI+BN7li63G+G4hRiejYJLG5CtokJMMgFSllt+Hwzf5cv/1OafR/1TQB/icKu4rNSCz+7y9uxWFtlfoJmLyXdCVDwSW8og0teenXavfCfo/cxgjY0fYAyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZmsennM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZmsennM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9A31F000FF;
	Thu, 10 Sep 2026 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049417;
	bh=j2ywU5ndKWzohIOYdau7uDzMhJdiG8vewKWl+Jupw1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BZmsennMuVE4FcB0Yh/f5xca2kkzcL6wWxRMeclW1Y13vsvpjjAx0eYFaXcWAZScH
	 88PtNw5O3Nh4M293PdtlO9KqMmbjlczGPml+3nHrBf4Hwdhxr6vG0zJic5zcoiQQB6
	 e0fsz+z9q9/wuRklQzoLCkMf3ZXos12lXuhLLI5vVKTVHM0IP/JkbDyadNiDNSbqNa
	 EeYooqSNhXN4LMaGDMp7rvRMwp5CpdSZEuIepDYgqh7go4wsrFI8yH4G9utNrx2M6x
	 wbcudOOFIhRwZWiFuMhzCGwItxnLABR4uGs5OFTOrkkho/rlhUfewO5nlLpjcwuqHN
	 mTXdDH40V+07g==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260817015903.137062-1-rosenp@gmail.com>
References: <20260817015903.137062-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: gen_bd: split struct
 bcom_psc_params from array definition
Message-Id: <178904941537.118320.17351318651836951944.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:15 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 16 Aug 2026 18:59:03 -0700, Rosen Penev wrote:
> The combined struct-definition-with-initializer pattern confuses the
> kernel-doc parser. Split into separate struct definition and array
> declaration.
> 
> Also now that it's fixed, it warns on missing members. Add those as
> well.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: gen_bd: split struct bcom_psc_params from array definition
      commit: 152fd3f4a2456221abb5b07e1682ca8a0b7798bb

Best regards,
-- 
~Vinod


