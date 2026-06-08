Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C0537DABD;
	Mon,  8 Jun 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920799; cv=none; b=d0pDMb52Ae5j+asiJzY+uX9LdDtNyhnvOppr1q3jRj1JkNpphRRIowIY6Z6VhoTkPTsplX1gUwtScnmXDJ8cg2kBwCPWPAL28F9fC9rq/JeDWBg4LJ/zJR6Cl3qORjmYS9VaVzStNkqt0yM0mgOOSxU6TgNMLtHLUzQMckYybAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920799; c=relaxed/simple;
	bh=GYOFshXSQ2rXp7L0Bti4gLR0Q8s6aqYfAMiRNc7lE+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YKKQ8uK+/884WcqihnqoRW1EwUUiyKuJ+Q6nkhtpxguMrV3S9Yj9Zf+OcHZpbXQSvgLWWSd48jv1RiVfz59mujW3ppAocjGn8HYdWJWMiHDghFVN0N38PNw6wzLXLFt+psR4J/1nC8kAI6+NMY8/YjBWdg8M+sykFHsP8PLrYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4gXuBVM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4gXuBVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0895D1F00893;
	Mon,  8 Jun 2026 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920798;
	bh=Iydd94isOhUeQpr5j0eFZ1PK9qHVg+SrEz2KxmyD7qE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h4gXuBVM060nEkQrSm8GnwkG61zbsEpNPfJwvo36tRxEE7PDajQlkcVXA1Em351KJ
	 k12kE6/eiV+H+7ApNOApDWfNl70PUUujowp3ddK/8Lmr8eRTfqSISsDO/qHpz0QwKf
	 7DXFm/oRsr94Z/cA/bTQhPaOkWYlq56XJ5I/kCWc0hDCiC4BdDb+YIc+HpmnlsDpoU
	 aKGfVQiRkG3G4xGtTfzdQBNakGTettJGipCTBt9uCQLFYlYlXTMS8hdfCnBwA3elYW
	 DUcB6Lxg0KHvc+Ps+AqiLSmcN6IS+/cW/c4IYI9oh1nuVb46ogPQWtJp47eeAqqPMQ
	 /YmhlB5kQi5Qg==
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Koichiro Den <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521142153.2957432-1-den@valinux.co.jp>
References: <20260521142153.2957432-1-den@valinux.co.jp>
Subject: Re: (subset) [PATCH 0/4] dmaengine: dw-edma: Fix probe paths and
 register races
Message-Id: <178092079664.96550.12858701594139945991.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:43:16 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 21 May 2026 23:21:49 +0900, Koichiro Den wrote:
> This series fixes pre-existing dw-edma issues flagged by Sashiko in:
> https://lore.kernel.org/dmaengine/20260521063115.2842238-1-den@valinux.co.jp/
> 
> Note: Patch 4 was based on a patch Frank posted in January:
>       https://lore.kernel.org/dmaengine/20260109-edma_ll-v2-1-5c0b27b2c664@nxp.com/
>       Since it has not been merged, I included it here. Frank, please let me
>       know if you prefer a different handling.
> 
> [...]

Applied, thanks!

[2/4] dmaengine: dw-edma-pcie: Reject devices without driver data
      commit: 11d7cfe0c119691b2dafbb699bbca90258c678aa
[4/4] dmaengine: dw-edma: Add spinlock to protect DONE_INT_MASK and ABORT_INT_MASK
      commit: 8ffba0171c6bbce5f093c6dba5a02c0805b31203

Best regards,
-- 
~Vinod


