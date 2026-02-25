Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828539448A;
	Wed, 25 Feb 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018654; cv=none; b=bY8vTFlPB8prFUXAHRH9u2mtcVK1zO85P7nRKGl+eQAndtfE8JhO8akoFRZbj084DUIIpCeKdU5aqxq/NyALQ3SMiPk4ah4XM9YV16WiRPGrQXApTUSMAieKQV06LTdb4n1k34DQWmdELq3Qd/e2aLqdRC+VLJ1ZRY2RsDmFjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018654; c=relaxed/simple;
	bh=sW1A9+1O+zA+cWsz9P6vjjJCuOo181YvignuZFEVKIs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qy40kpKjVjhZd/llmUc92EJOXc4USxkGXShBnLU2JljPy1R0AtT4Cw/tq71kj7lnBzbKy3Tw6nt5idNag1PKwyydTy+THEepulg89ti5nWzJJQaFrjTS4EJNOhN45O2e2j9UqezVH7EvcPe5Drg+UamgDwcV6BT76921tnltePE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI+R8v/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI+R8v/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1819AC116D0;
	Wed, 25 Feb 2026 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018653;
	bh=sW1A9+1O+zA+cWsz9P6vjjJCuOo181YvignuZFEVKIs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cI+R8v/ENv6r09g2SNUB4jd98Ye3cXikDQxUJLSNKhpzZUdhv7+bWBR7N6dIKLGOF
	 OMZ2N4Ll5uO+9Q01dC8+wOHdHmUB15kJzeW6qpFhWhIAPxTLeMObVq2GImk3tB1aru
	 DHV7S4kE/DEoiw+QGJkqD+aHScnleBzXuyIzmggH6yMnUdK4AUH6/RVRpV6xN+WEcj
	 jpHyjTB+F3AhtgYJYNKZUC0KOiTTvIoGWFJaqTfQuNG6sucFetPZNKQy6OzODS1uPc
	 eIxoEiuld+qh20B9cdRUkltLOlP32kBZQTwl9Lv+oN73ksjlhUnMUpMhMD2EFd6nsn
	 EiN6fa55mqAFg==
From: Vinod Koul <vkoul@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markus.Elfring@web.de, Khairul Anuar Romli <karom.9560@gmail.com>
In-Reply-To: <20260202060224.12616-1-karom.9560@gmail.com>
References: <20260202060224.12616-1-karom.9560@gmail.com>
Subject: Re: [PATCH v7 0/3] dmaengine: dw-axi-dmac: Coding style cleanups
Message-Id: <177201865172.93331.8302213117386942261.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 16:54:11 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 02 Feb 2026 14:02:16 +0800, Khairul Anuar Romli wrote:
> This series contains a patches that fix minor coding style issues in the
> Synopsys DesignWare AXI DMA Controller platform driver. This adjustment
> possibilities were detected with the help of the analysis tool
> “checkpatch.pl".
> 
> These changes are purely cosmetic:
> - Adjust indentation of function arguments and debug messages
> - Remove an unnecessary `return;` statement
> - Add a blank line for readability between functions
> 
> [...]

Applied, thanks!

[1/3] dmaengine: dw-axi-dmac: fix Alignment should match open parenthesis
      commit: 6c5883a9ba296d2797437066592d15b2d202de7a
[2/3] dmaengine: dw-axi-dmac: Add blank line after function
      commit: a1adb6de361be08352badb45cce3214b8cd6abed
[3/3] dmaengine: dw-axi-dmac: Remove unnecessary return statement from void function
      commit: 704eb9b17a6178b01b20e16ff8d36337bd90e429

Best regards,
-- 
~Vinod


